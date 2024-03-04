
import Foundation

class LocalMenuService {
    func loadingMenuProducts() -> [Menu] {
        let jsonLoader = JsonMenuLoader()
        let menu = jsonLoader.loadMenu(filename: "menu") ?? []
        return menu
    }
}
