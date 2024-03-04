
import Foundation

final class JsonMenuLoader {
    func loadMenu(filename: String) -> [Menu]? {
        if let url = Bundle.main.url(forResource: filename, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let jsonData = try JSONDecoder().decode(MenuResponce.self, from: data)

                return jsonData.menu
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}
