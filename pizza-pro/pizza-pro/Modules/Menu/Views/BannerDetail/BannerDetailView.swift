
import UIKit

final class BannerDetailView: UIView {
    
    private var selectedBanner: Banner?
    
    var onClosedBanner: (()->())?
    
    private let containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private var bannerImage: UIImageView = {
        let image = UIImageView()
        image.heightAnchor.constraint(equalToConstant: 200).isActive = true
        image.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        return image
    }()
    
    private let bannerTitle = CreateLabel(style: .titlelabel, text: "")
    private let bannerSubTitle = CreateLabel(style: .subTitleLabel, text: "")
    private let descriptionLabel = CreateLabel(style: .descriptionLabel, text: "")
    
    private lazy var dismissButton = CreateButton(style: .dismissButton, text: "xmark.circle")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTarget()
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ selectedBanner: Banner) {
        self.selectedBanner = selectedBanner
        bannerImage.image = UIImage(named: "\(selectedBanner.image)")
        bannerTitle.text = selectedBanner.title
        bannerSubTitle.text = selectedBanner.subTitle
        descriptionLabel.text = selectedBanner.description
    }
}



extension BannerDetailView {
    
    private func setupTarget() {
        dismissButton.addTarget(self, action: #selector(closedScreen(sender:)), for: .touchUpInside)
    }
    
    private func setupViews() {
        self.backgroundColor = .systemOrange
        
        self.addSubview(containerView)
        containerView.addSubview(bannerImage)
        containerView.addSubview(bannerTitle)
        containerView.addSubview(bannerSubTitle)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(dismissButton)
    }
    
    private func setupConstraints() {
        
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        bannerImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(containerView.safeAreaLayoutGuide)
        }
        
        bannerTitle.snp.makeConstraints { make in
            make.top.equalTo(bannerImage.snp.bottom).offset(50)
            make.leading.trailing.equalTo(bannerImage).inset(20)
        }
        
        bannerSubTitle.snp.makeConstraints { make in
            make.top.equalTo(bannerTitle.snp.bottom).offset(20)
            make.leading.trailing.equalTo(bannerTitle)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(bannerSubTitle.snp.bottom).offset(20)
            make.leading.trailing.equalTo(bannerSubTitle)
        }
        
        dismissButton.snp.makeConstraints { make in
            make.bottom.centerX.equalTo(containerView).inset(50)
        }
    }
    
    // MARK: - Action
    @objc private func closedScreen(sender: UIButton) {
        self.onClosedBanner?()
    }
}
