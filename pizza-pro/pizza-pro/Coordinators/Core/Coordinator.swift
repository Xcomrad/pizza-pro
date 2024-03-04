
import Foundation

protocol Coordinator: AnyObject {
    func start()
}

class BaseCoordinator: Coordinator {
    
    var allCoordinators: [Coordinator] = []
    
    func start() {}
    
    func addCoordinator(_ coordinator: Coordinator) {
        guard !allCoordinators.contains(where: { $0 === coordinator }) else { return }
        allCoordinators.append(coordinator)
    }
    
    func removeCoordinator(_ coordinator: Coordinator?) {
        guard allCoordinators.isEmpty ==  false, let coordinator = coordinator else { return }
        
        if let coordinator = coordinator as? BaseCoordinator, !coordinator.allCoordinators.isEmpty {
            coordinator.allCoordinators
                .filter({ $0 !== coordinator })
                .forEach({ coordinator.removeCoordinator($0)})
        }
        
        for (index, item) in allCoordinators.enumerated() where item === coordinator {
            allCoordinators.remove(at: index)
            break
        }
    }
}
