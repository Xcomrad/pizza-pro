
import UIKit

final class DocumentScreenVC: UIViewController {
    
   private var docView: DocScreenView { return self.view as! DocScreenView }
    
    override func loadView() {
        super.loadView()
        self.view = DocScreenView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissDoc()
    }
    
    //MARK: - Action
   private func dismissDoc() {
        docView.onCloseDoc = {
            self.dismiss(animated: true)
        }
    }
}





  
