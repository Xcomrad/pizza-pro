
import UIKit

final class DetailScreenVC: UIViewController {
    
    var currentProduct: Product?
    var cartArchiver = MenuArchieverImpl()
    
    private var detailView: DetailView { return self.view as! DetailView }
    
    override func loadView() {
        super.loadView()
        self.view = DetailView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
        dismissDetailScreen()
    }
}



extension DetailScreenVC {
    
    //MARK: - Public
    func update() {
        detailView.tableView.update(currentProduct!)
    }
    
    //MARK: - Action
    private func dismissDetailScreen() {
        detailView.dismissButton.onCloseDetail = {
            self.dismiss(animated: true, completion: nil)
        }
        detailView.buyButton.onAddProductInCart = {
            self.updateProductInCart()
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    private func updateProductInCart() {
        
        var productsInCart = cartArchiver.loadData()
        let isRepeatProduct = productsInCart.contains { $0.id == currentProduct?.id }
        
        defer {
            cartArchiver.saveData(productsInCart)
        }
        
        if productsInCart.isEmpty || !isRepeatProduct {
            productsInCart.append(currentProduct!)
            return
        }
        
        for product in productsInCart {
            
            var count = product.count ?? 1
            
            if product.id == currentProduct?.id {
                count  += 1
                product.count = count
            }
        }
    }
}
