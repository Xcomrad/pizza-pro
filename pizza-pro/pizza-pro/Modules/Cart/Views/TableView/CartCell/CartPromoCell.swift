
import UIKit

final class CartPromoCell: UITableViewCell {
    
    static let reuseId = "CartPromoCell"
    
    private let verticalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.directionalLayoutMargins = .init(top: 20, leading: 10, bottom: 20, trailing: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private let upperHorizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        return stack
    }()
    
    private let itemCount: UILabel = {
        let label = UILabel()
        label.text = "Вкусняшек на сумму"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        return label
    }()
    
    private lazy var priceCount: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        return label
    }()
    
    private let middleHorizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        return stack
    }()
    
    private let coinLabel: UILabel = {
        let label = UILabel()
        label.text = "Начислим бонусов"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        return label
    }()
    
    private lazy var coinCount: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        return label
    }()
    
    private let lowerHorizontalStack:  UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        return stack
    }()
    
    private let deliverylabel: UILabel = {
        let label = UILabel()
        label.text = "Доставка"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        return label
    }()
    
    private let finalDelivery: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public
    func update(_ price: Int, _ coin: Int) {
        priceCount.text = "\(price) ₽."
        coinCount.text = "+\(coin)"
        
        if price >= 600 {
            finalDelivery.text = "Бесплатно"
        } else {
            finalDelivery.text = "200 ₽."
        }
    }
}



extension CartPromoCell {
    
    private func setupViews() {
        contentView.addSubview(verticalStack)
        
        verticalStack.addArrangedSubview(upperHorizontalStack)
        upperHorizontalStack.addArrangedSubview(itemCount)
        upperHorizontalStack.addArrangedSubview(priceCount)
        
        verticalStack.addArrangedSubview(middleHorizontalStack)
        middleHorizontalStack.addArrangedSubview(coinLabel)
        middleHorizontalStack.addArrangedSubview(coinCount)
        
        verticalStack.addArrangedSubview(lowerHorizontalStack)
        lowerHorizontalStack.addArrangedSubview(deliverylabel)
        lowerHorizontalStack.addArrangedSubview(finalDelivery)
    }
    
    private  func setupConstraints() {
        verticalStack.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
}
