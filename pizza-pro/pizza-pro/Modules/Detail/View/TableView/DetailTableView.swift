
import UIKit

private enum DetailSection: Int, CaseIterable {
    case product
    case ingredient
}

 final class DetailTableView: UITableView {
     
     private var currentPoduct: Product?
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: .plain)
        self.allowsSelection = false
        self.separatorStyle = .none
        self.showsVerticalScrollIndicator = false
        
        self.delegate = self
        self.dataSource = self
        
        self.register(ProductDetailCell.self, forCellReuseIdentifier: ProductDetailCell.reuseId)
        self.register(DetailCollectionView.self, forCellReuseIdentifier: DetailCollectionView.reuseId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
     // MARK: - Public
     func update(_ currentPoduct: Product) {
         self.currentPoduct = currentPoduct
     }
}



extension DetailTableView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return DetailSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        let section = DetailSection(rawValue: section)
        
        switch section {
        case .product: return 1
        case .ingredient: return 1
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = DetailSection(rawValue: indexPath.section)
        
        switch section {
        case .product:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductDetailCell.reuseId, for: indexPath) as! ProductDetailCell
            cell.update(currentPoduct!)
            return cell
            
        case .ingredient:
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailCollectionView.reuseId, for: indexPath) as! DetailCollectionView
            return cell
            
        default:
            return UITableViewCell()
        }
    }
}

