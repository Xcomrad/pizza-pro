
import UIKit
import MapKit

final class MapView: UIView {
    
    var onCloseMap: (()->())?
    
    private let mapView: MKMapView = {
        let map = MKMapView()
        
        let location = CLLocation(latitude: 59.943575, longitude: 30.320261)
        map.centerLocation(location: location, radius: 7000)
        
        let cameraCenter = location
        let region = MKCoordinateRegion(center: cameraCenter.coordinate,
                                        latitudinalMeters: 50000,
                                        longitudinalMeters: 50000)
        map.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region), animated: true)
        
        let zoomRange = MKMapView.CameraZoomRange.init(maxCenterCoordinateDistance: 100000)
        map.setCameraZoomRange(zoomRange, animated: true)
        
        // Annotations
        let pizzaPlace = Places(title: "Пицца Pro",
                                locationAddress: "Большой проспект Петроградской стороны, 33",
                                type: "Пиццерия",
                                coordinate: CLLocationCoordinate2D(latitude: 59.958944, longitude: 30.301378))
        
        let secondPizzaPlace = Places(title: "Пицца Pro",
                                      locationAddress: "Невский проспект, 104",
                                      type: "Пиццерия",
                                      coordinate: CLLocationCoordinate2D(latitude: 59.931887, longitude: 30.356589))
        
        let thirdPizzaPlase = Places(title: "Пицца Pro",
                                     locationAddress: "1-я линия Васильевского острова, 42",
                                     type: "Пиццерия",
                                     coordinate: CLLocationCoordinate2D(latitude: 59.944781, longitude: 30.286411))
        
        map.addAnnotation(pizzaPlace)
        map.addAnnotation(secondPizzaPlace)
        map.addAnnotation(thirdPizzaPlase)
        return map
    }()
    
    private lazy var dismissButton = CreateButton(style: .dismissButton, text: "chevron.down.circle.fill")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTarget()
        setupView()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension MapView {
    
    private func setupTarget() {
        dismissButton.addTarget(self, action: #selector(closeScreen(sender:)), for: .touchUpInside)
    }
    
    private func setupView() {
        self.backgroundColor = .systemOrange
        self.addSubview(mapView)
        self.addSubview(dismissButton)
    }
    
    private func setupConstraints() {
        mapView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
        
        dismissButton.snp.makeConstraints { make in
            make.top.right.equalTo(self.safeAreaLayoutGuide).inset(20)
        }
    }
    
    // MARK: - Action
    @objc func closeScreen(sender: UIButton) {
        self.onCloseMap?()
    }
}



extension MKMapView {
    
    func centerLocation(location: CLLocation, radius regionRadius: CLLocationDistance) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}
