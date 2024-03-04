
import UIKit

final class DismissButtonView: UIView {
    
    var onCloseDetail: (()->())?
    
    private lazy var dismissButton = CreateButton(style: .dismissButton, text: "chevron.down.circle")
    
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



extension DismissButtonView {
    
   private func setupTarget() {
        dismissButton.addTarget(self, action: #selector(closeScreen(sender:)), for: .touchUpInside)
    }
    
    private func setupViews() {
        self.addSubview(dismissButton)
    }
    
    private func setupConstraints() {
        dismissButton.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
    // MARK: - Action
    @objc func closeScreen(sender: UIButton) {
        self.onCloseDetail?()
    }
}


