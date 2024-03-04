
import UIKit

final class CategoryCell: UICollectionViewCell {
    
    static let reuseId = "CategoryCell"

    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .gray
        label.textAlignment = .center
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            contentView.backgroundColor = self.isSelected ? .orange.withAlphaComponent(0.7) : .systemGray6
            categoryLabel.textColor = self.isSelected ? .white : .gray
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension CategoryCell {
    
    private func setupViews() {
        contentView.backgroundColor = .systemGray6
        contentView.layer.cornerRadius = 15
        
        contentView.addSubview(categoryLabel)
    }
    
    private func setupConstraints() {
        categoryLabel.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
    
    //MARK: Public update
    func update(_ category: Category) {
        categoryLabel.text = category.name
    }
}
