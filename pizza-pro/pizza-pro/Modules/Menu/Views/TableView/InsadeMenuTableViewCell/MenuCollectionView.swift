
import UIKit

private enum ProductSection: Int, CaseIterable {
    case product
}

final class MenuCollectionView: UICollectionView {
    
    var onSelectedProduct: ((Product)->())?
    
    private var product: [Product] = []
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 200)
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        self.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        self.delegate = self
        self.dataSource = self
        
        self.showsVerticalScrollIndicator = false
        self.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.reuseId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public update
    func update(_ product: [Product]) {
        self.product = product
    }
}



extension MenuCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = product[indexPath.row]
        onSelectedProduct?(product)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return product.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.dequeueReusableCell(withReuseIdentifier: ProductCell.reuseId, for: indexPath) as! ProductCell
        let product = product[indexPath.row]
        
        cell.update(product)
        return cell
    }
}
