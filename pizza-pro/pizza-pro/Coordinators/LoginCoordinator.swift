
import Foundation

class LoginCoordinator: BaseCoordinator {
    
    var finishLoginFlow: ((Bool)->())?
    
    private let screenfactory: ScreenFactory
    private let router: Router
    
    init(router: Router, screenfactory: ScreenFactory) {
        self.router = router
        self.screenfactory = screenfactory
    }
    
    override func start() {
        
        let loginScreen = screenfactory.makeLoginScreen()
        
        loginScreen.loginView.onLoginPasswordOn = { [weak self] isLogin in
            self?.finishLoginFlow?(isLogin) // 2.
        }
        
        router.setRootModule(loginScreen, hideBar: false)
    }
}
