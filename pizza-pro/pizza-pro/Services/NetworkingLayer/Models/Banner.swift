
import Foundation

// MARK: - BannerResponce
struct BannerResponce: Codable {
    var banner: [Banner]
}

// MARK: - Banner
struct Banner: Codable {
    var image: String
    var title: String
    var subTitle: String
    var description: String
}
