
import Foundation

class DetailCoordinator: BaseCoordinator {
    
    private let screenfactory: ScreenFactory
    private let router: Router
    
    init( router: Router, screenfactory: ScreenFactory) {
        self.router = router
        self.screenfactory = screenfactory
       
    }
    
    override func start() {
        
        let detailScreen = screenfactory.makeDetailScreen()
        router.present(detailScreen, animated: true)
    }
}
