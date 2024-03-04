
import UIKit
import MapKit

final class MapScreenVC: UIViewController {
    
    private var mapView: MapView { return self.view as! MapView }
    
    override func loadView() {
        super.loadView()
        self.view = MapView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        closeMap()
    }
    
    // MARK: - Action
    private func closeMap() {
        mapView.onCloseMap = {
            self.dismiss(animated: true)
        }
    }
}

