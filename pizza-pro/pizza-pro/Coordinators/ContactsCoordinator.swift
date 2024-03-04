
import Foundation

class ContactsCoordinator: BaseCoordinator {
    
    private let screenfactory: ScreenFactory
    private let router: Router
    
    init(router: Router, screenfactory: ScreenFactory) {
        self.router = router
        self.screenfactory = screenfactory
    }
}
