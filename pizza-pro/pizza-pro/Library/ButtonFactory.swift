
import UIKit

enum ButtonStyle: Int {
    case priceButton
    case imageButton
    case largeButton
    case buyButton
    case dismissButton
}

final class CreateButton: UIButton {
    
    init(style: ButtonStyle, text: String) {
        super.init(frame: .zero)
        
        switch style {
        case .priceButton: self.createPriceButton(text: text)
        case .imageButton: self.createImageButton(text: text)
        case .largeButton: self.createLargeButton(text: text)
        case .buyButton:   self.createBuyButton(text: text)
        case .dismissButton: self.createDismissButton(text: text)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createPriceButton(text: String) {
        self.setTitle(text, for: .normal)
        self.setTitleColor(.systemGray, for: .normal)
        self.backgroundColor = .systemGray6
        self.layer.cornerRadius = 10
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        self.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func createImageButton(text: String) {
        self.setImage(UIImage(named: text), for: .normal)
        self.contentVerticalAlignment = .fill
        self.contentHorizontalAlignment = .fill
        self.layer.masksToBounds = true
        self.clipsToBounds = true
        self.heightAnchor.constraint(equalToConstant: 45).isActive = true
        self.widthAnchor.constraint(equalToConstant: 45).isActive = true
        self.layer.cornerRadius = 10
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func createLargeButton(text: String) {
        self.setTitle(text, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        self.layer.cornerRadius = 10
        self.backgroundColor = .systemOrange.withAlphaComponent(0.6)
        self.setTitleColor(.brown, for: .normal)
        self.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func createBuyButton(text: String) {
        self.setTitle(text, for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.backgroundColor = .systemOrange
        self.layer.cornerRadius = 15
        self.heightAnchor.constraint(equalToConstant: 45).isActive = true
        self.addShadow(color: .black, opacity: 0.5, radius: 5, offset: CGSize(width: 0, height: 5))
    }
    
    func createDismissButton(text: String) {
        self.setImage(UIImage(systemName: text), for: .normal)
        self.tintColor = .systemOrange
        self.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.widthAnchor.constraint(equalToConstant: 40).isActive = true
        self.contentVerticalAlignment = .fill
        self.contentHorizontalAlignment = .fill
        self.backgroundColor = .white
        self.layer.cornerRadius = 20
        self.addShadow(color: .black, opacity: 0.5, radius: 5, offset: CGSize(width: 0, height: 5))
    }
    
}

