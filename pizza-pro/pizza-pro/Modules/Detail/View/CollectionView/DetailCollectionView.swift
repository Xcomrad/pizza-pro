
import UIKit

final class DetailCollectionView: UITableViewCell {
    
    static var reuseId = "DetailCollectionView"
    
    var ingredient: [Ingredient] = []
    
    private var containerStack: UIStackView = {
        let stack = UIStackView()
        stack.heightAnchor.constraint(equalToConstant: 1450).isActive = true
        return stack
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let itemsCount: CGFloat = 3
        let padding: CGFloat = 10
        let paddingCount: CGFloat = itemsCount + 1
        let paddingSize = paddingCount * padding
        let cellSize = (UIScreen.main.bounds.width - paddingSize) / itemsCount
        
        
        layout.minimumLineSpacing = padding
        layout.minimumInteritemSpacing = padding
        layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        layout.itemSize = CGSize(width: cellSize, height: 180)
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isScrollEnabled = false
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(IngredientDetailCell.self, forCellWithReuseIdentifier: IngredientDetailCell.reuseId)
        return collectionView
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        fetchIngredient()

    }
    
    //MARK: - Public
    func fetchIngredient() {
        ingredient = LocalIngredientService().fetchIngredient()
    }
}



extension DetailCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath)
        if selectedCell?.isSelected == true {
            UIView.animate(withDuration: 0.3) {
                selectedCell?.layer.borderWidth = 3
                selectedCell?.layer.cornerRadius = 15
                selectedCell?.layer.borderColor = UIColor.systemOrange.cgColor
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ingredient.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IngredientDetailCell.reuseId, for: indexPath) as! IngredientDetailCell
        
        let ingredient = ingredient[indexPath.row]
        cell.update(ingredient)
        return cell
    }
}



extension DetailCollectionView {
    
    private func setupViews() {
        contentView.addSubview(containerStack)
        containerStack.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        containerStack.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(containerStack)
        }
    }
}
