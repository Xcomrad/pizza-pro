
import UIKit

final class TabBarCoordinator: BaseCoordinator {
    
    private var tabBarController = UITabBarController()
    
    private let screenfactory: ScreenFactory
    private let router: Router
    
    init(router: Router, screenfactory: ScreenFactory) {
        self.router = router
        self.screenfactory = screenfactory
        self.tabBarController = .init()
    }
    
    override func start() {
        
        let tabBarPages: [TabBarPage] = [.menu, .contacts, .cart]
        
        let controllers: [UINavigationController] = tabBarPages.map({ createTabBarController($0) })
        
        setupTabBArController(withTabBarControllers: controllers)
    }
}

extension TabBarCoordinator {
    
    private func setupTabBArController(withTabBarControllers tabConrollers: [UIViewController]) {
        
        tabBarController.setViewControllers(tabConrollers, animated: true)
        tabBarController.selectedIndex = TabBarPage.menu.pageIndex()
        tabBarController.tabBar.tintColor = .systemOrange
        
        if let tabItems = tabBarController.tabBar.items {
            let tabItem = tabItems[2]
            //tabItem.badgeValue = ""
        }
        
        router.setRootModule(tabBarController)
    }
    
    private func createTabBarController(_ page: TabBarPage) -> UINavigationController {
        
        let navigationController = UINavigationController()
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.tabBarItem = UITabBarItem(title: page.pageTitle(),
                                                       image: page.pageImageView(),
                                                       selectedImage: page.pageSelectedImage())
        
        
        switch page {
            
        case .menu:
            let menuScreenVC = screenfactory.makeMenuScreen()
            navigationController.pushViewController(menuScreenVC, animated: false)
            
        case .contacts:
            let contactsScreenVC = screenfactory.makeContactsScreen()
            navigationController.pushViewController(contactsScreenVC, animated: false)
            
        case .cart:
            let cartScreenVC = screenfactory.makeCartScreen()
            navigationController.pushViewController(cartScreenVC, animated: false)
            
        }
        return navigationController
    }
}
