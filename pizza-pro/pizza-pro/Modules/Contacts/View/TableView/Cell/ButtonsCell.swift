
import UIKit

final class ButtonsCell: UITableViewCell {
    
    static var reuseId = "ButtonsView"
    
    let fbURL = URL(string: "https://www.facebook.com")!
    
    var onOpenFb:(()->())?
    var onOpenInst: (()->())?
    var onOpenYouTub: (()->())?
    
    private var container: UIStackView = {
        let stack = UIStackView()
        stack.heightAnchor.constraint(equalToConstant: 50).isActive = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private var horizontalStack: UIStackView = {
        var stackView = UIStackView.init()
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets (top: 0, leading: 60, bottom: 0, trailing: 60)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    var fbButton = CreateButton(style: .imageButton, text: "fb")
    var instButton = CreateButton(style: .imageButton, text: "inst")
    var youtubButton = CreateButton(style: .imageButton, text: "you")
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension ButtonsCell {
    
    private func setupViews() {
        contentView.addSubview(container)
        
        container.addArrangedSubview(horizontalStack)
        
        horizontalStack.addArrangedSubview(fbButton)
        horizontalStack.addArrangedSubview(instButton)
        horizontalStack.addArrangedSubview(youtubButton)
        
    }
    
    private func setupConstraints() {
        container.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        horizontalStack.snp.makeConstraints { make in
            make.top.equalTo(container).inset(10)
        }
    }
}
