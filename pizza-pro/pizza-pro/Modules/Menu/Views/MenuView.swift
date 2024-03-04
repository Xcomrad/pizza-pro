
import UIKit

final class MenuView: UIView {
    
    private var category: [Category] = []
    
    var bannerCollectionView = BannerCollectionView()
    var categoryCollection = CategoryCollectionView()
    var menuTableView = MenuTableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        
        categoryCollection.onCategoryTapped = { index in
            self.menuTableView.scrollToRow(at: [0, index], at: .top, animated: true)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ banner: [Banner], _ data: [Category], _ menu: [Menu]) {
        self.category = data
        
        self.bannerCollectionView.update(banner)
        self.categoryCollection.update(category)
        self.menuTableView.update(menu, category)
    }
}



extension MenuView {
    func setupViews() {
        self.backgroundColor = .systemBackground
        
        self.addSubview(bannerCollectionView)
        self.addSubview(categoryCollection)
        self.addSubview(menuTableView)
    }
    
    func setupConstraints() {
        bannerCollectionView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self.safeAreaLayoutGuide)
            make.height.equalTo(100)
        }
        categoryCollection.snp.makeConstraints { make in
            make.top.equalTo(bannerCollectionView.snp.bottom)
            make.leading.trailing.equalTo(self)
            make.height.equalTo(60)
        }
        menuTableView.snp.makeConstraints { make in
            make.top.equalTo(categoryCollection.snp.bottom)
            make.left.right.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
