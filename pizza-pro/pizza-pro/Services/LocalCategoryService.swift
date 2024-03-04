
import Foundation

struct Category {
    let id: Int
    let name: String
}

class LocalCategoryService {
    var categories: [Category] = [
        Category(id: 1, name: "Пицца"),
        Category(id: 2, name: "Закуски"),
        Category(id: 3, name: "Десерты"),
        Category(id: 4, name: "Напитки"),
        Category(id: 5, name: "Соусы"),
    ]
    
    func fetchCategories() -> [Category] {
        return categories
    }
}

