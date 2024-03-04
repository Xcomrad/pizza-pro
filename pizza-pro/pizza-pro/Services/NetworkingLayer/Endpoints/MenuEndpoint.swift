
// https://apingweb.com/api/rest/f42316ce83b25613bdc6428eccd0956e16/menu

import Foundation

enum MenuEndpoint {
    case getMenu
}

extension MenuEndpoint: MainEndpoint {
    
    var scheme: String {
        switch self {
        case .getMenu:
            return "https"
        }
    }
    
    var host: String {
        switch self {
        case .getMenu:
            return "apingweb.com"
        }
    }
    
    var path: String {
        switch self {
        case .getMenu:
            return "/api/rest/f42316ce83b25613bdc6428eccd0956e16/menu"
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
