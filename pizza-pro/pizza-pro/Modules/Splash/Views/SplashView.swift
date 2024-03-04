
import UIKit

final class SplashView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Готовим пиццу..."
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        return label
    }()
    
    var circleView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.layer.cornerRadius = 100
        view.image = UIImage(named: "dodo")
        return view
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



extension SplashView {
        
    private func setupViews() {
        
        self.backgroundColor = .systemOrange.withAlphaComponent(0.9)
        self.addSubview(titleLabel)
        self.addSubview(circleView)
    }
    
    private func setupConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).inset(100)
            make.leading.trailing.equalTo(self).inset(50)
        }
        
        circleView.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY)
            make.width.height.equalTo(300)
        }
    }
}
