
import UIKit

final class MapHeaderView: UIView {
    
    var onMapTapped: (()->())?
    
    private let container: UIView = {
        let container = UIView()
        container.widthAnchor.constraint(equalToConstant:UIScreen.main.bounds.width).isActive = true
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private let mapImage: UIImageView = {
        var image = UIImageView.init()
        image.image = UIImage.init(named: "map")
        image.contentMode = .scaleAspectFill
        image.widthAnchor.constraint(equalToConstant: 350).isActive = true
        image.heightAnchor.constraint(equalToConstant: 350).isActive = true
        image.layer.cornerRadius = 170
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var mapButton: UIButton = {
        let button = UIButton()
        button.setTitle("Пиццерии на карте", for: .normal)
        button.setTitleColor(.systemOrange, for: .normal)
        button.setTitleColor(.white, for: .highlighted)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 23)
        button.backgroundColor = .white
        button.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        button.heightAnchor.constraint(equalToConstant: 55).isActive = true
        button.addTarget(self, action: #selector(openMap), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Action
    @objc func openMap() {
        self.onMapTapped?()
    }
}



extension MapHeaderView {
    
    private func setupViews() {
        self.addSubview(container)
        
        container.addSubview(mapImage)
        container.addSubview(mapButton)
    }
    
    private func setupConstraints() {
        container.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
        mapImage.snp.makeConstraints { make in
            make.centerX.equalTo(container)
        }
        mapButton.snp.makeConstraints { make in
            make.top.equalTo(mapImage).inset(260)
        }
    }
}
