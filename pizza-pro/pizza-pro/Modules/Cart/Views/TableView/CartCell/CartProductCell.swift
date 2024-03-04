
import UIKit

final class CartProductCell: UITableViewCell {
    
    let stepper = Stepper()
    
    static let reuseId = "CartProductCell"
    
    private let rootVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private let upperHrizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()
    
    private let middleVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private let lowerHrizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        return imageView
    }()
    
    private var nameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .heavy)
        label.numberOfLines = 0
        return label
    }()

    private var priceLabel: UILabel = {
       let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        
        animate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public
    func update(product: Product, index: Int) {
        productImageView.image = UIImage(named: product.image)
        nameLabel.text = "\(product.name)"
        priceLabel.text = "\(product.price) ₽."
        
        stepper.countValue = Int(product.count ?? 1)
        
        stepper.index = index
    }
}



extension CartProductCell {
    
    private func setupViews() {
        contentView.addSubview(rootVerticalStackView)
        
        rootVerticalStackView.addArrangedSubview(upperHrizontalStackView)
        upperHrizontalStackView.addArrangedSubview(productImageView)
        
        upperHrizontalStackView.addArrangedSubview(middleVerticalStackView)
        middleVerticalStackView.addArrangedSubview(nameLabel)
        
        rootVerticalStackView.addArrangedSubview(lowerHrizontalStackView)
        lowerHrizontalStackView.addArrangedSubview(priceLabel)
        lowerHrizontalStackView.addArrangedSubview(stepper)
    }
    
    private func setupConstraints() {
        rootVerticalStackView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
    
   private func animate() {
       UIView.animate(withDuration: 1, delay: .zero, usingSpringWithDamping: 0.8, initialSpringVelocity: 3, options: .curveEaseIn) {
            self.contentView.layoutIfNeeded()
        }
    }
}
