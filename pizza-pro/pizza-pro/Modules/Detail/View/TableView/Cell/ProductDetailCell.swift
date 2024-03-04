
import UIKit

final class ProductDetailCell: UITableViewCell {
    
    static var reuseId = "ProductDetailCell"
    
    private var container: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    private var detailImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.heightAnchor.constraint(equalToConstant: 250).isActive = true
        image.widthAnchor.constraint(equalToConstant: 250).isActive = true
        return image
    }()
    
    private var namelabel = CreateLabel(style: .titlelabel, text: "")
    private var detailLabel = CreateLabel(style: .descriptionLabel, text: "")
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension ProductDetailCell {
    
    private func setupViews() {
        contentView.addSubview(container)
        
        container.addArrangedSubview(detailImageView)
        container.addArrangedSubview(namelabel)
        container.addArrangedSubview(detailLabel)
    }
    
    private func setupConstraints() {
        container.snp.makeConstraints { make in
            make.edges.equalTo(contentView).inset(10)
        }
    }
    
    // MARK: - Public
    func update(_ product: Product) {
        detailImageView.image = UIImage(named: "\(product.image)")
        namelabel.text = product.name
        detailLabel.text = product.description
    }
}
