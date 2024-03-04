
import Foundation

// MARK: - Product
class Product: Codable {

    var id: Int
    var name: String
    var description: String?
    var count: Int?
    var coin: Int?
    var price: Int
    var image: String
    var isNew: Bool
    
    init(id: Int, name: String, description: String? = nil, count: Int? = 1, coin: Int?, price: Int, image: String, isNew: Bool) {
        self.id = id
        self.name = name
        self.description = description
        self.count = count
        self.coin = coin
        self.price = price
        self.image = image
        self.isNew = isNew
    }
    
}

