
import UIKit

final class IngredientDetailCell: UICollectionViewCell {
    
    static var reuseId = "IngredientDetailCell"
    
    private var container: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 5
        stack.backgroundColor = .white
        stack.layer.cornerRadius = 15
        stack.directionalLayoutMargins = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    private var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.widthAnchor.constraint(equalToConstant: 90).isActive = true
        image.heightAnchor.constraint(equalToConstant: 90).isActive = true
        image.clipsToBounds = true
        return image
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.numberOfLines = .max
        return label
    }()
    
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        setupShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension IngredientDetailCell {
    
    private func setupViews() {
        contentView.addSubview(container)
        container.addArrangedSubview(imageView)
        container.addArrangedSubview(nameLabel)
        container.addArrangedSubview(priceLabel)
    }
    
    private func setupConstraints() {
        container.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
    
    //MARK: - Update
    func update(_ ingredient: Ingredient) {
        imageView.image = UIImage(named: "\(ingredient.image)")
        nameLabel.text = "\(ingredient.name)"
        priceLabel.text = "\(ingredient.price) ₽."
    }
    
    private func setupShadow() {
        self.addShadow(color: .black, opacity: 0.5, radius: 5, offset: CGSize(width: 0, height: 5))
    }
}


