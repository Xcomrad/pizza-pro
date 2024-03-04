
import UIKit
import WebKit

final class BrowserView: UIView {
    
    let webView: WKWebView = {
        let preference = WKWebpagePreferences()
        preference.allowsContentJavaScript = true
        preference.preferredContentMode = .mobile
        
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences = preference
        
        var webView = WKWebView(frame: .zero, configuration: configuration)
        return webView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension BrowserView {
    
    private func setupViews() {
        self.addSubview(webView)
    }
    
    private func setupConstraints() {
        webView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
}
