
import UIKit

 final class EmptyView: UIView {
    
    var onReternMenu: (()->())?

    private let verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .center
        return stack
    }()
    
    private let dogImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "dog")
        image.heightAnchor.constraint(equalToConstant: 150).isActive = true
        image.widthAnchor.constraint(equalToConstant: 150).isActive = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
     private let titleLabel = CreateLabel(style: .titlelabel, text: "Ой, пусто!")
     private let descriptionLabel = CreateLabel(style: .descriptionLabel, text: "Ваша корзина пуста, откройте «Меню» \n и выберите понравившейся товар.")
     private let subTitleLabel = CreateLabel(style: .descriptionLabel, text: "Мы доставим ваш заказ бесплатно от 600 ₽.")
    
     private lazy var menuButton = CreateButton(style: .buyButton, text: "Перейти в Меню")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTarget()
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension EmptyView {
    
    private func setupTarget() {
        menuButton.addTarget(self, action: #selector(enterMenuVC(sender:)), for: .touchUpInside)
    }
    
    private func setupViews() {
        self.addSubview(dogImage)
        
        self.addSubview(verticalStack)
        verticalStack.addArrangedSubview(titleLabel)
        verticalStack.addArrangedSubview(descriptionLabel)
        verticalStack.addArrangedSubview(subTitleLabel)
        
        self.addSubview(menuButton)
    }
    
    
    private func setupConstraints() {
        dogImage.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).inset(50)
            make.left.right.equalTo(self).inset(30)
        }
        
        verticalStack.snp.makeConstraints { make in
            make.top.equalTo(dogImage.snp.bottom).inset(-50)
            make.left.right.equalTo(self).inset(20)
        }
        
        menuButton.snp.makeConstraints { make in
            make.left.right.equalTo(dogImage).inset(30)
            make.top.equalTo(verticalStack.snp.bottom).offset(50)
            make.height.equalTo(50)
        }
    }
    
    // MARK: - Action
    @objc func enterMenuVC(sender: UIButton) {
        self.onReternMenu?()
    }
}

