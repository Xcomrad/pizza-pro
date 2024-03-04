
import Foundation

class MenuCoordinator: BaseCoordinator {
    
    private let screenfactory: ScreenFactory
    private let router: Router
    
    init(router: Router, screenfactory: ScreenFactory) {
        self.router = router
        self.screenfactory = screenfactory
    }
    
    override func start() {
        let menuScreen = screenfactory.makeMenuScreen()
        router.setRootModule(menuScreen, hideBar: false)
    }
}
