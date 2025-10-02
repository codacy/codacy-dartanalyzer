package codacy.dartanalyzer

import com.codacy.plugins.api.results.{Pattern, Result}
import com.codacy.plugins.api.Source
import org.scalatest.matchers.should.Matchers
import org.scalatest.wordspec.AnyWordSpec

class DartAnalyzerSpecs extends AnyWordSpec with Matchers {

  "sanitizeOutput" should {

    "Outputs same lines as input" in {

      val sanitized =
        DartAnalyzer.sanitizeOutput(
          List(
            "INFO|LINT|prefer_final_parameters|/src/lib/switch_theme/view/switch_theme_editor.dart|96|28|5|Prefer final for parameter declarations if they are not reassigned.",
            "INFO|LINT|always_specify_types|/src/lib/switch_theme/view/switch_theme_editor.dart|76|5|5|Specify type annotations."
          )
        )

      sanitized.size shouldBe 2
    }

    "Not be modified if `deprecated message` is not on output" in {
      val sanitized =
        DartAnalyzer.sanitizeOutput(List("Issue1", "Issue2"))

      sanitized.size shouldBe 2
    }

    "Remove `part` feature related message" in {

      val sanitized = DartAnalyzer.sanitizeOutput(
        List(
          "INFO|LINT|prefer_final_parameters|/src/lib/switch_theme/view/switch_theme_editor.dart|96|28|5|Prefer final for parameter declarations if they are not reassigned.",
          "/src/lib/app_bar_theme/cubit/app_bar_theme_state.dart " + DartAnalyzer.partMessage,
          DartAnalyzer.partInfoMessage
        )
      )

      sanitized.size shouldBe 1
      sanitized.contains(DartAnalyzer.partInfoMessage) shouldBe false
      sanitized.contains(DartAnalyzer.partMessage) shouldBe false

    }

    "Remove `deprecated message` and `part`" in {
      val sanitized = DartAnalyzer.sanitizeOutput(
        List(
          "INFO|LINT|prefer_final_parameters|/src/lib/switch_theme/view/switch_theme_editor.dart|96|28|5|Prefer final for parameter declarations if they are not reassigned.",
          "/src/lib/app_bar_theme/cubit/app_bar_theme_state.dart " + DartAnalyzer.partMessage,
          DartAnalyzer.partInfoMessage
        )
      )

      sanitized.size shouldBe 1
      sanitized.contains(DartAnalyzer.partInfoMessage) shouldBe false
      sanitized.contains(DartAnalyzer.partMessage) shouldBe false
    }
  }

  "parseMachineFormat" should {

    "parse valid machine format correctly" in {
      val input = "INFO|LINT|prefer_final_parameters|/src/lib/switch_theme/view/switch_theme_editor.dart|96|28|5|Prefer final for parameter declarations if they are not reassigned."
      
      val result = DartAnalyzer.parseMachineFormat(input)
      
      result shouldBe a[Result.Issue]
      val issue = result.asInstanceOf[Result.Issue]
      issue.filename shouldBe Source.File("/src/lib/switch_theme/view/switch_theme_editor.dart")
      issue.message shouldBe Result.Message("Prefer final for parameter declarations if they are not reassigned.")
      issue.patternId shouldBe Pattern.Id("prefer_final_parameters")
      issue.line shouldBe Source.Line(96)
    }

    "parse machine format with escaped pipe in message" in {
      val input = "INFO|LINT|prefer_final_parameters|/src/lib/switch_theme/view/switch_theme_editor.dart|96|28|5|Message with escaped \\| pipe."
      
      val result = DartAnalyzer.parseMachineFormat(input)
      
      result shouldBe a[Result.Issue]
      val issue = result.asInstanceOf[Result.Issue]
      issue.filename shouldBe Source.File("/src/lib/switch_theme/view/switch_theme_editor.dart")
      issue.message shouldBe Result.Message("Message with escaped \\| pipe.")
      issue.patternId shouldBe Pattern.Id("prefer_final_parameters")
      issue.line shouldBe Source.Line(96)
    }
  }
}
