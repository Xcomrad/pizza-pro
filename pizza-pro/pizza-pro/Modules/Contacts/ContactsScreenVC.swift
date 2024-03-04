
import UIKit

final class ContactsScreenVC: UIViewController {
    
    private var contactsView: ContactsView { return self.view as! ContactsView }
    
    override func loadView() {
        super.loadView()
        self.view = ContactsView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        call()
        openMap()
        openBrowser()
        showDocuments()
    }
}



extension ContactsScreenVC {
    
    // MARK: - Action
    private func openMap() {
        contactsView.contactsTableView.mapHeader.onMapTapped = {
            let mapController = Di.shared.screenfactory.makeMapScreen()
            mapController.modalPresentationStyle = .fullScreen
            self.present(mapController, animated: true)
        }
    }
    
    private func call() {
        contactsView.contactsTableView.onCall = {
            self.makePhoneCall()
        }
    }
    
    private func openBrowser() {
        contactsView.contactsTableView.onOpenYou = {
            let webController = Di.shared.screenfactory.makeBrowserScreen()
            let youURL = URL(string: "https://www.youtube.com")!
            webController.updateURL(youURL)
            self.present(webController, animated: true)
        }
        
        contactsView.contactsTableView.onOpenFb = {
            let webController = Di.shared.screenfactory.makeBrowserScreen()
            let fbURL = URL(string: "https://www.facebook.com")!
            webController.updateURL(fbURL)
            self.present(webController, animated: true)
        }
        
        contactsView.contactsTableView.onOpenInst = {
            let webController = Di.shared.screenfactory.makeBrowserScreen()
            let instURL = URL(string: "https://www.instagram.com")!
            webController.updateURL(instURL)
            self.present(webController, animated: true)
        }
    }
    
    private func showDocuments() {
        contactsView.contactsTableView.onShowDoc = {
            let docController = Di.shared.screenfactory.makeDocScreen()
            docController.modalPresentationStyle = .fullScreen
            self.present(docController, animated: true)
        }
    }
    
    private func makePhoneCall() {
        let number = "0770"
        guard let number = URL(string: "tel://" + number) else { return }
        UIApplication.shared.open(number)
    }
}
