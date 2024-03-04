
import UIKit
import SnapKit

final class LoginScreenVC: UIViewController {
    
    var loginView: LoginView { return self.view as! LoginView }
    
    override func loadView() {
        super.loadView()
        self.view = LoginView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 0.4, delay: 0.2) {
            self.loginView.helloLabel.center.x += self.view.bounds.width
            
            UIView.animate(withDuration: 0.5, delay: 0.3) {
                self.loginView.nameLabel.center.x += self.view.bounds.width
                self.loginView.nameTextField.center.x += self.view.bounds.width
            }
            
            UIView.animate(withDuration: 0.6, delay: 0.4) {
                self.loginView.phoneLabel.center.x += self.view.bounds.width
                self.loginView.phoneTextField.center.x += self.view.bounds.width
            }
            
            UIView.animate(withDuration: 0.7, delay: 0.5) {
                self.loginView.registerButton.center.x += self.view.bounds.width
            }
        }
    }
}
