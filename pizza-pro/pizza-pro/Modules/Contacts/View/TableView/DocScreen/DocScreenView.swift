
import UIKit

final class DocScreenView: UIView {
    
    var onCloseDoc: (()->())?
    
    private lazy var dismissButton = CreateButton(style: .dismissButton, text: "chevron.down.circle.fill")
       
    private let titleLabel = CreateLabel(style: .titlelabel, text: "Пользовательское соглашение")
    private let subTitleLabel = CreateLabel(style: .subTitleLabel, text: "ПРИСОЕДИНЕНИЕ К СОГЛАШЕНИЮ")
    private let descriptionlabel = CreateLabel(style: .descriptionLabel, text: """
                    Общие положения:
                    2.1. Настоящее Пользовательское соглашение (далее "Соглашение") определяет правила и порядок использования Приложения, права и обязанности Пользователей, а также регулирует поведение Пользователей при получении доступа к Приложению и Услугам.
                    
                    2.2. Пользователь принимает условия данного Соглашения путем проставления специальной галочки в отведенном поле при загрузке Приложения на смартфон или другое устройство.
                    
                    2.3. Данное Соглашение является обязательным для его сторон (т.е. для Компании и Пользователя). Уступка Пользователем своих прав по данному Соглашению возможна только после получения предварительного письменного согласия от Компании.
                    """)
    
    
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



extension DocScreenView {
    
    private func setupTarget() {
        dismissButton.addTarget(self, action: #selector(closeScreen(sender:)), for: .touchUpInside)
    }
    
    private func setupViews() {
        self.backgroundColor = .systemOrange
        self.addSubview(dismissButton)
        self.addSubview(titleLabel)
        self.addSubview(subTitleLabel)
        self.addSubview(descriptionlabel)
    }
    
    private func setupConstraints() {
        dismissButton.snp.makeConstraints { make in
            make.top.right.equalTo(self.safeAreaLayoutGuide).inset(20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(dismissButton.snp.bottom).offset(20)
            make.leading.trailing.equalTo(self).inset(20)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.trailing.equalTo(self).inset(20)
        }
        
        descriptionlabel.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(20)
            make.leading.trailing.equalTo(self).inset(20)
        }
    }
    
    // MARK: - Action
    @objc func closeScreen(sender: UIButton) {
        self.onCloseDoc?()
    }
}
