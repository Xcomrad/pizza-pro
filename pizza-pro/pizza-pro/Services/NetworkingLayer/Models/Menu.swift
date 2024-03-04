import Foundation

// MARK: - MenuResponce
struct MenuResponce: Codable {
    let menu: [Menu]
}

// MARK: - Menu
struct Menu: Codable {
    let categoryID: Int
    let products: [Product]
}
