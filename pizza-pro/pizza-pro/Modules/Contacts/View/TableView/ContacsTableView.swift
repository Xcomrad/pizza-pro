
import UIKit

private enum SetupViews: Int, CaseIterable {
    case call
    case buttons
    case documents
}

final class ContactsTableView: UITableView {
    
    var onCall: (()->())?
  
    var onOpenFb: (()->())?
    var onOpenInst: (()->())?
    var onOpenYou: (()->())?
    
    var onShowDoc: (()->())?
    
    let mapHeader = MapHeaderView.init(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 350))
    
    init() {
        super.init(frame: .zero, style: .plain)
        
        self.delegate = self
        self.dataSource = self
        
        self.allowsSelection = false
        self.separatorStyle = .none
        
        self.tableHeaderView = mapHeader
        
        self.register(PhoneCell.self, forCellReuseIdentifier: PhoneCell.reuseId)
        self.register(ButtonsCell.self, forCellReuseIdentifier: ButtonsCell.reuseId)
        self.register(DocumentsCell.self, forCellReuseIdentifier: DocumentsCell.reuseId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension ContactsTableView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SetupViews.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let section = SetupViews(rawValue: section)
        
        switch section {
        case .call: return 1
        case .buttons: return 1
        case .documents: return 1
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = SetupViews.init(rawValue: indexPath.section)
        
        switch section {
        case .call:
            let cell = tableView.dequeueReusableCell(withIdentifier: PhoneCell.reuseId, for: indexPath) as! PhoneCell
            
            cell.callButton.addTarget(self, action: #selector(makeCall(sender:)), for: .touchUpInside)
            
            return cell
            
        case .buttons:
            let cell = tableView.dequeueReusableCell(withIdentifier: ButtonsCell.reuseId, for: indexPath) as! ButtonsCell
            
            cell.youtubButton.addTarget(self, action: #selector(openYou(sender:)), for: .touchUpInside)
            cell.instButton.addTarget(self, action: #selector(openInst(sender:)), for: .touchUpInside)
            cell.fbButton.addTarget(self, action: #selector(openFb(sender:)), for: .touchUpInside)
            
            return cell
            
        case.documents:
            let cell = tableView.dequeueReusableCell(withIdentifier: DocumentsCell.reuseId, for: indexPath) as! DocumentsCell
            
            // Cell side button
            let chevronButton = UIButton(type: .system)
            chevronButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
            chevronButton.contentMode = .scaleAspectFit
            chevronButton.tintColor = .systemOrange
            chevronButton.sizeToFit()
            chevronButton.addTarget(self, action: #selector(openScreen(sender:)), for: .touchUpInside)
            
            cell.accessoryView = chevronButton
            
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    //MARK: - Action
    @objc func makeCall(sender: UIButton) {
        self.onCall?()
    }
    
    @objc func openYou(sender: UIButton) {
        self.onOpenYou?()
    }
    
    @objc func openInst(sender: UIButton) {
        self.onOpenInst?()
    }
    
    @objc func openFb(sender: UIButton) {
        self.onOpenFb?()
    }
    
    @objc func openScreen(sender: UIButton) {
        self.onShowDoc?()
    }
}
