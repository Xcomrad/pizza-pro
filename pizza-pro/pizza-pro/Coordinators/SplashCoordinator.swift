
import UIKit

final class SplashCoordinator: BaseCoordinator {
    
    var finishSplashFlow: (()->())?
    
    let router: Router
    let screenFactory: ScreenFactory
    
    init(router: Router, screenFactory: ScreenFactory) {
        self.router = router
        self.screenFactory = screenFactory
    }
    
    override func start() {
        
        let splashScreen = screenFactory.makeSplashScreen()
        
        splashScreen.startLoginFlow = {
            self.finishSplashFlow?() // 2
        }
        
        router.setRootModule(splashScreen, hideBar: false)
        
    }
}
