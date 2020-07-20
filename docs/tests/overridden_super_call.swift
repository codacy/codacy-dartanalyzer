//#Patterns: overridden_super_call

//#Issue: {"severity": "Info", "line": 8, "patternId": "overridden_super_call"}
//#Issue: {"severity": "Info", "line": 16, "patternId": "overridden_super_call"}
//#Issue: {"severity": "Info", "line": 25, "patternId": "overridden_super_call"}

    class VC: UIViewController {
    	override func viewWillAppear(_ animated: Bool) {
    		//Not calling to super
    		self.method()
    	}
    }


    class VC: UIViewController {
    	override func viewWillAppear(_ animated: Bool) {
    		super.viewWillAppear(animated)
    		//Other code
    		super.viewWillAppear(animated)
    	}
    }


    class VC: UIViewController {
    	override func didReceiveMemoryWarning() {
    	}
    }
