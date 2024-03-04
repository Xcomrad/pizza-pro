
import UIKit

final class DetailView: UIView {
    
    let tableView = DetailTableView()
    let dismissButton = DismissButtonView()
    let buyButton = DetailBuyButtonView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension DetailView {
    
    private func setupViews() {
        self.backgroundColor = .white
        
        self.addSubview(tableView)
        self.addSubview(buyButton)
        self.addSubview(dismissButton)
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
        
        buyButton.snp.makeConstraints { make in
            make.left.right.equalTo(self)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
        
        dismissButton.snp.makeConstraints { make in
            make.top.right.equalTo(tableView).inset(20)
        }
    }
}

