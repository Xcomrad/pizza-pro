
import UIKit

final class BannerDetailScreenVC: UIViewController {
    
    var selectedBanner: Banner?
    
    var bannerDetailView: BannerDetailView { return self.view as! BannerDetailView }
    
    override func loadView() {
        super.loadView()
        self.view = BannerDetailView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerDetailView.update(selectedBanner!)
        dismissDetailScreen()
    }
    
    //MARK: - Action
    private func dismissDetailScreen() {
        bannerDetailView.onClosedBanner = {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
