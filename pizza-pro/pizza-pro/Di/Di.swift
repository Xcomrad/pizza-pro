
import UIKit

class Di {
    
    static var shared: Di = Di()
    
    let screenfactory: ScreenFactoryImpl
    let coordinatorfactory: CoordinatorFactoryImpl
    let archiver: MenuArchieverImpl
    
    init() {
        self.screenfactory = ScreenFactoryImpl()
        self.coordinatorfactory = CoordinatorFactoryImpl(screenFactory: screenfactory)
        self.archiver = MenuArchieverImpl()
        
        screenfactory.di = self
        
    }
}

protocol AppFactory {
    func makeKeyWithAppCoordinator(_ window: UIWindow?) -> (UIWindow?, Coordinator)
}

extension Di: AppFactory {
    
    // Start coordinator
    func makeKeyWithAppCoordinator(_ window: UIWindow?) -> (UIWindow?, Coordinator) {
        
        let rootVC = UINavigationController()
        let router = RouterImpl(rootController: rootVC)
        let coordinator = coordinatorfactory.makeAppCoordinator(router: router)
        
        window?.rootViewController = rootVC
        return (window, coordinator)
    }
}
