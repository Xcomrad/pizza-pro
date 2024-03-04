
import Foundation

final class AppCoordinator: BaseCoordinator {
    
    private let coordinatorFactory: CoordinatorFactory
    private let router: Router
    
    init(router: Router, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        startSplashFlow()
        startDetailFlow()
    }
    
    private func startSplashFlow() {
        
        let splashCoordinator = coordinatorFactory.makeSplashCoordinator(router: router) // create coordinator
        
        splashCoordinator.finishSplashFlow = {// 3
            
            self.startLoginFlow()
            self.removeCoordinator(splashCoordinator) // remove splashCoordinator
        }
        
        self.addCoordinator(splashCoordinator) // add next flow
        splashCoordinator.start()
    }
    
    private func startLoginFlow() {
        
        let loginCoordinator = coordinatorFactory.makeLoginCoordinator(router: router)
        
        loginCoordinator.finishLoginFlow = { isLogin in // 3.
            
            self.startMainFlow()
            self.removeCoordinator(loginCoordinator) // remove loginCoordinator
        }
        
        self.addCoordinator(loginCoordinator) // add coordinator in coordinatorArray
        loginCoordinator.start() // start loginCoordinator
    }
    
    private func startMainFlow() {
        
        let mainCoordinator = coordinatorFactory.makeTabBarCoordinator(router: router)
        
        self.addCoordinator(mainCoordinator)
        mainCoordinator.start()
    }
    
    private func startDetailFlow() {
        
        let detailCoordinator = coordinatorFactory.makeDetailCoordinator(router: router)
        
        self.addCoordinator(detailCoordinator)
        detailCoordinator.start()
    }
}
