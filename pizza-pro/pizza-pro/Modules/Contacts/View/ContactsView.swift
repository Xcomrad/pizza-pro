
import UIKit

final class ContactsView: UIView {
    
    var contactsTableView = ContactsTableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
        self.setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension ContactsView {
    
    private func setupViews() {
        self.backgroundColor = .white
        self.addSubview(contactsTableView)
    }
    
    private func setupConstraints() {
        contactsTableView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
