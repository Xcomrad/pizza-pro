
import Foundation

final class JsonBannerLoader {
    func loadBanner(filename: String) -> [Banner]? {
        if let url = Bundle.main.url(forResource: filename, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let jsonData = try JSONDecoder().decode(BannerResponce.self, from: data)

                return jsonData.banner
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}
