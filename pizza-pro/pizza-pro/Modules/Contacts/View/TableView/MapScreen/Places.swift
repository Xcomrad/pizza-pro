
import Foundation
import MapKit

class Places: NSObject, MKAnnotation {
    
    let title: String?
    let locationAddress: String?
    let type: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String? = nil, locationAddress: String? = nil, type: String? = nil, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationAddress = locationAddress
        self.type = type
        self.coordinate = coordinate
    }
}
