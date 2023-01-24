package codacy.dartanalyzer

import org.scalatest.matchers.should.Matchers
import org.scalatest.wordspec.AnyWordSpec

class DartAnalyzerSpecs extends AnyWordSpec with Matchers {

  "sanitizeStderr" should {

    "Remove first line if it contains `deprecated message`" in {

      val sanitized =
        DartAnalyzer.sanitizeStderr(
          List(
            "INFO|LINT|prefer_final_parameters|/src/lib/switch_theme/view/switch_theme_editor.dart|96|28|5|Prefer final for parameter declarations if they are not reassigned.",
            "INFO|LINT|always_specify_types|/src/lib/switch_theme/view/switch_theme_editor.dart|76|5|5|Specify type annotations."
          )
        )

      sanitized.size shouldBe 2
    }

    "Not be modified if `deprecated message` is not on output" in {
      val sanitized =
        DartAnalyzer.sanitizeStderr(List("Issue1", "Issue2"))

      sanitized.size shouldBe 2
    }

    "Remove `part` feature related message" in {

      val sanitized = DartAnalyzer.sanitizeStderr(
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
      val sanitized = DartAnalyzer.sanitizeStderr(
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
}
