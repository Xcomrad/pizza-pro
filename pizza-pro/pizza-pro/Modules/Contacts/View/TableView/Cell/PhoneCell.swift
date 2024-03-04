
import UIKit

final class PhoneCell: UITableViewCell {
    
    static let reuseId = "PhoneCell"
    
    private let container: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.heightAnchor.constraint(equalToConstant: 100).isActive = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let callLabel: UILabel = {
        let label = UILabel()
        label.text = "Связаться с поддержкой"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    lazy var callButton = CreateButton(style: .buyButton, text: "Позвонить")
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension PhoneCell {
    
    private func setupViews() {
        contentView.addSubview(container)
        
        container.addArrangedSubview(callLabel)
        container.addArrangedSubview(callButton)
    }
    
    private func setupConstraints() {
        container.snp.makeConstraints { make in
            make.edges.equalTo(contentView).inset(20)
        }
    }
}
