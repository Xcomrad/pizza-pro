
import Foundation

class CartCoordinator: BaseCoordinator {
    
    private let screenfactory: ScreenFactory
    private let router: Router
    
    init(router: Router, screenfactory: ScreenFactory) {
        self.router = router
        self.screenfactory = screenfactory
    }
}
