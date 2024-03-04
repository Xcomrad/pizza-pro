
import UIKit

final class MenuScreenVC: UIViewController {
    
    //private var bannerService = BannerServiceImpl()
    //private var menuService = MenuServiceImpl()
    private var localCategoryService = LocalCategoryService()
    private var localMenuSrvice = LocalMenuService()
    private var localBannerService = LocalBannerService()

    private var banner: [Banner] = []
    private var menu: [Menu] = []
    private var category: [Category] = []
    
    private var menuView: MenuView { return self.view as! MenuView }
    
    override func loadView() {
        super.loadView()
        self.view = MenuView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popupAppear()
        fetchProducts()
        openDetail()
        
        menuView.update(banner, category, menu)
        
        menuView.bannerCollectionView.onSelectedBanner = { banner in
            self.openBanner(banner)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        menuView.categoryCollection.selectItem(at: [0,0], animated: false, scrollPosition: .top)
    }
}



extension MenuScreenVC {
    
    private func popupAppear() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
            let popView = PopupView()
            self.view.addSubview(popView)
        }
    }
    
    private func fetchProducts() {
        
        self.category = localCategoryService.fetchCategories()
        self.menu = localMenuSrvice.loadingMenuProducts()
        self.banner = localBannerService.loadingBannerProducts()
//        Task {
//            do {
//                let menu = try await menuService.fetchMenu()
//                menuView.menuTableView.update(menu, category)
//                
//                let banner = try await bannerService.fetchBanners()
//                menuView.bannerCollectionView.update(banner)
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
    }
}


//MARK: - ACTION
extension MenuScreenVC {
    
    private func openDetail() {
        menuView.menuTableView.onSelectedProduct = { product in
            let detail = Di.shared.screenfactory.makeDetailScreen()
            detail.currentProduct = product
            self.present(detail, animated: true)
        }
    }
    
    private func openBanner(_ banner: Banner) {
        menuView.bannerCollectionView.onSelectedBanner = { banner in
            let bannerDetail = BannerDetailScreenVC()
            bannerDetail.modalPresentationStyle = .fullScreen
            bannerDetail.selectedBanner = banner
            self.present(bannerDetail, animated: true)
        }
    }
}


