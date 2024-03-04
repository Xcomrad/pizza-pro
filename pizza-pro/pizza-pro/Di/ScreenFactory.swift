
import Foundation

protocol ScreenFactory {
    func makeSplashScreen() -> SplashScreenVC
    func makeLoginScreen() -> LoginScreenVC
    func makeMenuScreen() -> MenuScreenVC
    func makeDetailScreen() -> DetailScreenVC
    func makeContactsScreen() -> ContactsScreenVC
    func makeBrowserScreen() -> BrowserVC
    func makeMapScreen() -> MapScreenVC
    func makeDocScreen() -> DocumentScreenVC
    func makeCartScreen() -> CartScreenVC
    
}

class ScreenFactoryImpl: ScreenFactory {
    
    weak var di: Di!
    
    func makeSplashScreen() -> SplashScreenVC {
        return SplashScreenVC()
    }
    
    func makeLoginScreen() -> LoginScreenVC {
        return LoginScreenVC()
    }
    
    func makeMenuScreen() -> MenuScreenVC {
        return MenuScreenVC()
    }
    
    func makeDetailScreen() -> DetailScreenVC {
        return DetailScreenVC()
    }
    
    func makeContactsScreen() -> ContactsScreenVC {
        return ContactsScreenVC()
    }
    
    func makeBrowserScreen() -> BrowserVC {
        return BrowserVC()
    }
    
    func makeMapScreen() -> MapScreenVC {
        return MapScreenVC()
    }
    
    func makeDocScreen() -> DocumentScreenVC {
        return DocumentScreenVC()
    }
    
    func makeCartScreen() -> CartScreenVC {
        return CartScreenVC()
    }
}
