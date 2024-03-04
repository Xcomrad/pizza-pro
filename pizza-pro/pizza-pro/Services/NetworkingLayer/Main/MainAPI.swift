
import Foundation

protocol MainAPI {
    func request<T: Decodable>(endpoint: MainEndpoint, responceModel: T.Type) async throws -> T
}

extension MainAPI {
    
    func request<T: Decodable>(endpoint: MainEndpoint, responceModel: T.Type) async throws -> T {
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        
        guard let url = urlComponents.url else {
            throw NetworkErrors.invalidURL }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.methods.rawValue
        
        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        
        let session = URLSession(configuration: .default)
        let decoder = JSONDecoder()
        
        do {
            let (data, responce) = try await session.data(for: request)
            guard let responce = responce as? HTTPURLResponse else {
                throw NetworkErrors.noResponce
            }
            
            switch responce.statusCode {
            case 200..<300:
                let model = try decoder.decode(responceModel, from: data)
                return model
                
            case 400..<500:
                throw NetworkErrors.unauthorized
                
            default: throw NetworkErrors.unexpectedStatusCode
            }
            
        } catch {
            print(error.localizedDescription)
            throw NetworkErrors.unknown
        }
    }
}
