
import UIKit

final class MenuCell: UITableViewCell {
    
    static var reuseId = "MenuCategoryCell"
    
    var onSelectedProduct: ((Product)->())?
    
    private var menuCollectionView = MenuCollectionView()
    private var product: [Product] = []
    
    private let categoryTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        
        menuCollectionView.onSelectedProduct = { product in
            self.onSelectedProduct?(product)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Public
    func update(_ category: Category, _ products: [Product]) {
        self.product = products
        self.categoryTitle.text = category.name
        self.menuCollectionView.update(products)
        self.menuCollectionView.reloadData()
    }
}

extension MenuCell {
    private func setupViews() {
        contentView.addSubview(categoryTitle)
        contentView.addSubview(menuCollectionView)
    }
    
    private func setupConstraints() {
        categoryTitle.snp.makeConstraints { make in
            make.top.left.right.equalTo(contentView).inset(10)
        }
        
        menuCollectionView.snp.makeConstraints { make in
            make.top.equalTo(categoryTitle.snp.bottom)
            make.left.right.bottom.equalTo(contentView)
        }
    }
}

