
import UIKit

final class DocumentsCell: UITableViewCell {
    
    static var reuseId = "DocumentsView"
    
    lazy var docTitle: UILabel = {
        let label = UILabel()
        label.text = "Пользовательское соглашение"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension DocumentsCell {
    
    private func setupViews() {
        contentView.addSubview(docTitle)
 
    }
    
    private func setupConstraints() {
        docTitle.snp.makeConstraints { make in
            make.edges.equalTo(contentView).inset(20)
        }
    }
}
