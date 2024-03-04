
import UIKit

final class SplashScreenVC: UIViewController {
    
    var startLoginFlow: (()->())?
    
    var splashView: SplashView { return view.self as! SplashView }
    
    override func loadView() {
        super.loadView()
        self.view = SplashView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.startLoginFlow?() // 1
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        UIView.animate(springDuration: 500, bounce: 0, initialSpringVelocity: 1, delay: 0, options: .repeat) {
            self.splashView.circleView.transform = CGAffineTransform(rotationAngle: -256)
        }
    }
}



