
import UIKit
import WebKit

final class BrowserVC: UIViewController {
    
    var browserView: BrowserView { return self.view as! BrowserView }
    
    override func loadView() {
        super.loadView()
        self.view = BrowserView(frame: UIScreen.main.bounds)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Public
     func updateURL(_ url: URL) {
        let myRequest = URLRequest(url: url)
         self.browserView.webView.load(myRequest)
    }
}




