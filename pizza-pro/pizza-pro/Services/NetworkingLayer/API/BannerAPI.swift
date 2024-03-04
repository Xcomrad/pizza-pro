
import Foundation

protocol BannerService {
    func fetchBanners() async throws -> [Banner]
}

final class BannerServiceImpl: BannerService, MainAPI {
   
    func fetchBanners() async throws -> [Banner] {
        return try await request(endpoint: BannerEndpoint.getStory, responceModel: BannerResponce.self).banner
    }
}
