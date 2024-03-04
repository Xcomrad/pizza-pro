
import UIKit

final class CartBuyButtonView: UIView {
    
    var onSendOrder: (()->())?
    
    private lazy var buyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemOrange
        button.setTitleColor(.systemOrange, for: .highlighted)
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        button.addShadow(color: .black, opacity: 0.5, radius: 5, offset: CGSize(width: 0, height: 5))
        button.addTarget(self, action: #selector(sendOrder), for: .touchUpInside)
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
    @objc func sendOrder() {
        self.onSendOrder?()
    }
    
    //MARK: - Public
    func update(_ price: Int) {
        buyButton.setTitle("Оформить заказ", for: .normal)
    }
}


extension CartBuyButtonView {
    
    private func setupViews() {
        self.addSubview(buyButton)
    }
    
    private func setupConstraints() {
        buyButton.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(20)
        }
    }
}
