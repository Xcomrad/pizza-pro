
import UIKit

final class CartView: UIView {
    
    let emptyView = EmptyView()
    let cartTableView = CartTableView()
    let cartBuyButton = CartBuyButtonView()
    
    private var order = Order(products: [])
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupView()
        setupConstraints()
        
        cartTableView.onProductIsEmpty = {
            self.hiddenViews()
            self.update(self.order)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public
    func update(_ order: Order) {
        self.order = order
        
        self.cartTableView.update(order)
        self.cartBuyButton.update(order.totalPrice)
        self.cartTableView.reloadData()
        
        hiddenViews()
    }
    
    private func hiddenViews() {
        if order.products.isEmpty {
            cartTableView.isHidden = true
            cartBuyButton.isHidden = true
            emptyView.isHidden = false
        } else {
            emptyView.isHidden = true
            cartTableView.isHidden = false
            cartBuyButton.isHidden = false
        }
    }
}



extension CartView {
    
    private func setup() {
        self.backgroundColor = .white
    }
    
    private func setupView() {
        self.addSubview(emptyView)
        self.addSubview(cartTableView)
        self.addSubview(cartBuyButton)
        
    }
    
    private func setupConstraints() {
        
        cartTableView.snp.makeConstraints { make in
            make.top.left.right.equalTo(self.safeAreaLayoutGuide)
            make.bottom.equalTo(cartBuyButton.snp.top)
        }
        
        cartBuyButton.snp.makeConstraints { make in
            make.left.right.equalTo(self)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
        
        emptyView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
