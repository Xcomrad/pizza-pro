
import UIKit

final class MenuTableView: UITableView {
    
    var onSelectedProduct: ((Product)->())?
    
    private var menu: [Menu] = []
    private var category: [Category] = []
    
    init() {
        super.init(frame: .zero, style: .plain)
        
        self.delegate = self
        self.dataSource = self
        
        self.separatorStyle = .none
        self.showsVerticalScrollIndicator = false
        self.isScrollEnabled = true
        
        self.register(MenuCell.self, forCellReuseIdentifier: MenuCell.reuseId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public
    func update(_ products: [Menu], _ category: [Category]) {
        self.menu = products
        self.category = category
        self.reloadData()
    }
    
    private func filtredProductsByCategory(_ id: Int) -> [Product] {
        return menu.first(where: { $0.categoryID == id })?.products ?? []
    }
}



extension MenuTableView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: MenuCell.reuseId, for: indexPath) as! MenuCell
        cell.selectionStyle = .none
        
        let category = category[indexPath.row]
        let product = filtredProductsByCategory(category.id)
        
        cell.onSelectedProduct = { product in
            self.onSelectedProduct?(product)
        }
        
        cell.update(category, product)
        
        return cell
    }
}
