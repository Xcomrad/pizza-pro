
import Foundation

class LocalBannerService {
    func loadingBannerProducts() -> [Banner] {
        let jsonLoader = JsonBannerLoader()
        let banner = jsonLoader.loadBanner(filename: "banner") ?? []
        return banner
    }
}
