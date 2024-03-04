
import UIKit

final class LoginView: UIView {
    
    var onLoginPasswordOn: ((Bool)->())?
    
   private let verticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        return stack
    }()
    
    let helloLabel: UILabel = {
        let label = UILabel()
        label.text = "Добро пожаловать в Пицца Pro! \n Авторизуйтесь чтобы продолжить."
        label.textAlignment = .center
        label.numberOfLines = 3
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Введите ваше имя"
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        let leftImage = UIImageView(image: UIImage(systemName: "person"))
        leftImage.tintColor = .systemBackground
        leftImage.widthAnchor.constraint(equalToConstant: 35).isActive = true
        leftImage.heightAnchor.constraint(equalToConstant: 35).isActive = true
        leftImage.translatesAutoresizingMaskIntoConstraints = false
        
        textField.text = "******"
        textField.leftView = leftImage
        textField.leftViewMode = .always
        textField.clearButtonMode = .whileEditing
        textField.keyboardType = .asciiCapable
        return textField
    }()
    
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "Введите ваш номер"
        return label
    }()
    
    let phoneTextField: UITextField = {
        let textField = UITextField()
        let leftImage = UIImageView(image: UIImage(systemName: "phone"))
        leftImage.tintColor = .systemBackground
        leftImage.widthAnchor.constraint(equalToConstant: 35).isActive = true
        leftImage.heightAnchor.constraint(equalToConstant: 35).isActive = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.text = "****"
        textField.leftView = leftImage
        textField.leftViewMode = .always
        textField.clearButtonMode = .whileEditing
        textField.keyboardType = .phonePad
        return textField
    }()
    
    func separatorLine() -> UILabel {
        let label = UILabel()
        label.backgroundColor = .systemBackground
        label.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return label
    }
    
    lazy var registerButton = CreateButton(style: .buyButton, text: "Продолжить")
    
    @objc func openMenuScreen() {
        onLoginPasswordOn?(true) // 1.
    }
    
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



extension LoginView {
    
    private func setupTarget() {
        registerButton.addTarget(self, action: #selector(openMenuScreen), for: .touchUpInside)
    }
    
    private func setupViews() {
        self.backgroundColor = .systemOrange.withAlphaComponent(0.9)
        self.addSubview(helloLabel)
        
        self.addSubview(verticalStackView)
        
        verticalStackView.addArrangedSubview(nameLabel)
        verticalStackView.addArrangedSubview(nameTextField)
        verticalStackView.addArrangedSubview(separatorLine())
        
        verticalStackView.addArrangedSubview(phoneLabel)
        verticalStackView.addArrangedSubview(phoneTextField)
        verticalStackView.addArrangedSubview(separatorLine())
        
        self.addSubview(registerButton)
        
    }
    
    private func setupConstraints() {
        
        helloLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).inset(100)
            make.leading.trailing.equalTo(self).inset(20)
        }
        
        verticalStackView.snp.makeConstraints { make in
            make.top.equalTo(helloLabel).inset(150)
            make.leading.trailing.equalTo(self).inset(20)
            make.bottom.equalTo(registerButton).inset(150)
        }
     
        registerButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.safeAreaLayoutGuide).inset(200)
            make.leading.trailing.equalTo(self).inset(50)
            make.height.width.equalTo(50)
        }
    }
}
