
import Foundation

protocol MenuService {
    func fetchMenu() async throws -> [Menu]
}

final class MenuServiceImpl: MenuService, MainAPI {
    
    func fetchMenu() async throws -> [Menu] {
        return try await request(endpoint: MenuEndpoint.getMenu, responceModel: MenuResponce.self).menu
       
    }
}
