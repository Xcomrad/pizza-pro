
import UIKit

final class BannerCell: UICollectionViewCell {
    
    static var reuseId = "BannerCell"
    
    private let bannerImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension BannerCell {
    
   private func setup() {
        contentView.backgroundColor = .systemBackground
        contentView.layer.borderWidth = 3
        contentView.layer.borderColor = UIColor.systemOrange.cgColor
        contentView.layer.cornerRadius = 20
    }
    
    private func setupViews() {
        contentView.addSubview(bannerImage)
        
    }
    
    private func setupConstraints() {
        bannerImage.snp.makeConstraints { make in
            make.edges.equalTo(contentView).inset(5)
        }
    }
    
    // MARK: - Update
    func update(_ banner: Banner) {
        bannerImage.image = UIImage(named: "\(banner.image)")
    }
}
