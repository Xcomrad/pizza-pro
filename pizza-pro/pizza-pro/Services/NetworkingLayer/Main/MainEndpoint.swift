
import Foundation

protocol MainEndpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var methods: HTTPMethods { get }
    var port: String? { get }
    var parameters: [URLQueryItem]? { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
}
