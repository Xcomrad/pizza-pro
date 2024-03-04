
import Foundation

//https://apingweb.com/api/rest/66eb5f3dc6335db6c2a202cba733972618/banner

enum BannerEndpoint {
    case getStory
}

extension BannerEndpoint: MainEndpoint {
    
    var scheme: String {
        switch self {
        case .getStory:
            return "https"
        }
    }
    
    var host: String {
        switch self {
        case .getStory:
            return "apingweb.com"
        }
    }
    
    var path: String {
        switch self {
        case .getStory:
            return "/api/rest/66eb5f3dc6335db6c2a202cba733972618/banner"
        }
    }
    
    var methods: HTTPMethods {
        return HTTPMethods.get
    }
    
    var port: String? {
        return nil
    }
    
    var parameters: [URLQueryItem]? {
        return nil
    }
    
    var header: [String : String]? {
        return nil
    }
    
    var body: [String : String]? {
        return nil
    }
}
