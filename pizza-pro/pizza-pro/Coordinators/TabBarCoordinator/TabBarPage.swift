
import UIKit

enum TabBarPage {
    case menu
    case contacts
    case cart
    
    init?(index: Int) {
        switch index {
        case 0: self = .menu
        case 1: self = .contacts
        case 2: self = .cart
        default: return nil
        }
    }
    
    func pageTitle() -> String {
        switch self {
        case .menu: return "Меню"
        case .contacts: return "Контакты"
        case .cart: return "Корзина"
        }
    }
    
    func pageIndex() -> Int {
        switch self {
        case .menu: return 0
        case .contacts: return 1
        case .cart: return 2
        }
    }
    
    func pageImageView() -> UIImage? {
        switch self {
        case .menu: return UIImage(systemName: "menucard")
        case .contacts: return UIImage(systemName: "phone")
        case .cart: return UIImage(systemName: "cart")
        }
    }
    
    func pageSelectedImage() -> UIImage? {
        switch self {
        case .menu: return UIImage(systemName: "menucard.fill")
        case .contacts: return UIImage(systemName: "phone.fill")
        case .cart: return UIImage(systemName: "cart.fill")
        }
    }
}
