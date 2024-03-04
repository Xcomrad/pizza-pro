
import UIKit

final class PopupView: UIView {
    
    private let popupContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 25
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addShadow(color: .white, opacity: 5, radius: 3, offset: CGSize(width: 0, height: 5))
        return view
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 15
        return stack
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Оп-пачки!"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "diablo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.text = "А у нас новинки! \n Острая Диабло теперь доступна к заказу."
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var successButton: UIButton = {
        let button = UIButton()
        button.setTitle("Вкусно", for: .normal)
        button.backgroundColor = .systemOrange
        button.setTitleColor(.systemOrange, for: .highlighted)
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.addTarget(self, action: #selector(dissmisPopup), for: .touchUpInside)
        button.addShadow(color: .black, opacity: 0.5, radius: 5, offset: CGSize(width: 0, height: 5))
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupViews()
        setupConstraints()
        
        animateIn()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}





extension PopupView {
    
    @objc func animateOut() {
        
        UIView.animate(springDuration: 0.5, bounce: 0, initialSpringVelocity: 0.7, options: .curveEaseInOut) {
            self.popupContainerView.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
            self.alpha = 0
        } completion: { (complete) in
            if complete {
                self.removeFromSuperview()
            }
        }
    }
    
    @objc func animateIn() {
        
        self.popupContainerView.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
        self.alpha = 0
        
        UIView.animate(springDuration: 0.5, bounce: 0, initialSpringVelocity: 0.7, options: .curveEaseIn) {
            self.popupContainerView.transform = .identity
            self.alpha = 1
        }
    }
    
    @objc func dissmisPopup() {
        self.animateOut()
    }
}





extension PopupView {
    
    private func setup() {
        self.frame = UIScreen.main.bounds
        self.backgroundColor = .gray
        
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animateOut)))
    }
    
    private func setupViews() {
        self.addSubview(popupContainerView)
        
        popupContainerView.addSubview(stackView)
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(textLabel)
        stackView.addArrangedSubview(successButton)
    }
    
    private func setupConstraints() {
        
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(200)
        }
        
        stackView.snp.makeConstraints {
            $0.edges.equalTo(self.popupContainerView).inset(20)
        }
        
        popupContainerView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        popupContainerView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        popupContainerView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        popupContainerView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
    }
}


