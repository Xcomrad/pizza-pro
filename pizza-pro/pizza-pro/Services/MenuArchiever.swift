
import Foundation

protocol MenuArchiver {
    func saveData(_ product: [Product])
    func loadData() -> [Product]
    func removeData()
}

final class MenuArchieverImpl: MenuArchiver {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "Product"

    func saveData(_ product: [Product]) {
        do {
            let data = try encoder.encode(product)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func loadData() -> [Product] {
        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
        do {
            let array = try decoder.decode([Product].self, from: data)
            return array
        } catch {
            print(error)
        }
        
        return []
    }
    
    func removeData() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
}
