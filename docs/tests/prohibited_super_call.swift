//#Patterns: prohibited_super_call

//#Issue: {"severity": "Info", "line": 9, "patternId": "prohibited_super_call"}
//#Issue: {"severity": "Info", "line": 16, "patternId": "prohibited_super_call"}
//#Issue: {"severity": "Info", "line": 24, "patternId": "prohibited_super_call"}
//#Issue: {"severity": "Info", "line": 33, "patternId": "prohibited_super_call"}

    class VC: UIViewController {
    	override func loadView() {
    		super.loadView()
    	}
    }


    class VC: NSFileProviderExtension {
    	override func providePlaceholder(at url: URL,completionHandler: @escaping (Error?) -> Void) {
    		self.method1()
    		super.providePlaceholder(at:url, completionHandler: completionHandler)
    	}
    }


    class VC: NSView {
    	override func updateLayer() {
    		self.method1()
    		super.updateLayer()
    		self.method2()
    	}
    }


    class VC: NSView {
    	override func updateLayer() {
    		defer {
    			super.updateLayer()
    		}
    	}
    }
