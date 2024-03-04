
import UIKit

class CartScreenVC: UIViewController {
    
    var order = Order(products: [])
    var archiver = MenuArchieverImpl()
    
    private var cartView: CartView { return self.view as! CartView }
    
    override func loadView() {
        super.loadView()
        self.view = CartView(frame: UIScreen.main.bounds)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        order = Order(products: archiver.loadData())
        update()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        action()
        removeOrder()
    }
}



extension CartScreenVC {
    
    // MARK: - Public
    func update() {
        self.cartView.update(order)
    }
    
    // MARK: - ACTION
    func action() {
        cartView.emptyView.onReternMenu = {
            self.tabBarController?.selectedIndex = 0
        }
    }
    
    func removeOrder() {
        cartView.cartBuyButton.onSendOrder = {
            self.archiver.removeData()
            self.tabBarController?.selectedIndex = 0
        }
    }
}
