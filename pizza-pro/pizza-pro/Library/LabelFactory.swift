
import UIKit

enum LabelStyle: Int {
    case titlelabel
    case subTitleLabel
    case descriptionLabel
}

class CreateLabel: UILabel {
    
    init(style: LabelStyle, text: String) {
        super.init(frame: .zero)
        
        switch style {
        case .titlelabel: self.createTitleLabel(text: text)
        case .subTitleLabel: self.createSubTitle(text: text)
        case .descriptionLabel: self.createDescriptionLabel(text: text)
   
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createTitleLabel(text: String) {
        self.text = text
        self.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        self.textAlignment = .left
        self.numberOfLines = 0
    }
    
    func createSubTitle(text: String) {
        self.textAlignment = .left
        self.numberOfLines = 0
        self.textColor = .systemGray
        self.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    }
    
    func createDescriptionLabel(text: String) {
        self.text = text
        self.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        self.textColor = .darkGray
        self.textAlignment = .left
        self.numberOfLines = 0
    }
    
 
}
