
import Foundation

protocol CoordinatorFactory {
    func makeSplashCoordinator(router: Router) -> SplashCoordinator
    func makeAppCoordinator(router: Router) -> AppCoordinator
    func makeLoginCoordinator(router: Router) -> LoginCoordinator
    func makeDetailCoordinator(router: Router) -> DetailCoordinator
    func makeMenuCoordinator(router: Router) -> MenuCoordinator
    func makeContactsCoordinator(router: Router) -> ContactsCoordinator
    func makeCartCoordinator(router: Router) -> CartCoordinator
    func makeTabBarCoordinator(router: Router) -> TabBarCoordinator
}

class CoordinatorFactoryImpl: CoordinatorFactory {
    
    let screenFactory: ScreenFactoryImpl
    
    init(screenFactory: ScreenFactoryImpl) {
        self.screenFactory = screenFactory
    }
    
    func makeAppCoordinator(router: Router) -> AppCoordinator {
        return AppCoordinator(router: router, coordinatorFactory: self)
    }
    
    func makeSplashCoordinator(router: Router) -> SplashCoordinator {
        return SplashCoordinator(router: router, screenFactory: screenFactory)
    }
    
    func makeLoginCoordinator(router: Router) -> LoginCoordinator {
        return LoginCoordinator(router: router, screenfactory: screenFactory)
    }
    
    func makeDetailCoordinator(router: Router) -> DetailCoordinator {
        return DetailCoordinator(router: router, screenfactory: screenFactory)
    }
    
    func makeMenuCoordinator(router: Router) -> MenuCoordinator {
        return MenuCoordinator(router: router, screenfactory: screenFactory)
    }
    
    func makeContactsCoordinator(router: Router) -> ContactsCoordinator {
        return ContactsCoordinator(router: router, screenfactory: screenFactory)
    }
    
    func makeCartCoordinator(router: Router) -> CartCoordinator {
        return CartCoordinator(router: router, screenfactory: screenFactory)
    }
    
    func makeTabBarCoordinator(router: Router) -> TabBarCoordinator {
        return TabBarCoordinator(router: router, screenfactory: screenFactory)
    }
}
