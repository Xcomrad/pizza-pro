
import UIKit

final class CartTotalPriceCell: UITableViewCell {
    
    static var reuseId = "CartTotalPriceCell"
    
    private var container: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        return stack
    }()
    
    private var priceLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17, weight: .heavy)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension CartTotalPriceCell {
    
    private func setupView() {
        contentView.addSubview(container)
        container.addSubview(priceLabel)
    }
    
    private func setupConstraints() {
        container.snp.makeConstraints { make in
            make.edges.equalTo(contentView).inset(20)
            make.height.equalTo(contentView).inset(20)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.edges.equalTo(container)
        }
    }
    
    // MARK: - Public
    func update(_ count: Int, _ price: Int) {
        priceLabel.text = "\(count) товара на сумму \(price) ₽."
        
        if count == 1 {
            priceLabel.text = "\(count) товар на сумму \(price) ₽."
        } else if count < 5  {
            priceLabel.text = "\(count) товара на сумму \(price) ₽."
        } else if count >= 5 {
            priceLabel.text = "\(count) товаров на сумму \(price) ₽."
        }
    }
}
