
import Foundation

enum NetworkErrors: Error {
    case decode
    case invalidURL
    case noResponce
    case unauthorized
    case unexpectedStatusCode
    case unknown
    
    var description: String {
        switch self {
        case .decode: return "Decode error"
        case .invalidURL: return "Invalid URL"
        case .noResponce: return "No responce"
        case .unauthorized: return "No authorization"
        case .unexpectedStatusCode: return "Unexpected status code"
        case .unknown: return "Unknown error"
        }
    }
}
