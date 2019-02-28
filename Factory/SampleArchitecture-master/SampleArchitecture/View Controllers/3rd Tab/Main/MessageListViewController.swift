

import Foundation
import UIKit


protocol MessageListViewControllerProtocol: class {
    func didSelectMessage(_ message: Message)
}

class MessageListViewController: UIViewController {
    
    typealias Factory = ViewControllerFactoryProtocol & NetworkManagerProtocol
    private let factory: Factory
    
    weak var delegate: MessageListViewControllerProtocol?
    
    var tableView: UITableView!
    
    var messages: [Message]? {
        didSet{
            tableView.reloadData()
        }
    }
    
    init(factory: Factory, messages: [Message]?) {
        self.factory = factory
        self.messages = messages
        super.init(nibName: nil, bundle: nil)
        
        tableView = UINib.init(nibName: "MessageListViewController", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! MessageListTableView
        
        tableView.delegate = self
        tableView.dataSource = self
        
        refresh()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func refresh() {
        self.factory.getNetworkManager().fetchMessages(handler: { (messages) in
            self.messages = messages
        })
    }
}


//MARK: UITableViewDelegate
extension MessageListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let messages = messages else { return }
        delegate?.didSelectMessage(messages[indexPath.row])
    }
}

//MARK: UITableViewDataSource
extension MessageListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = messages![indexPath.row].text
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let messages = messages else {
            return 0
        }
        return messages.count
    }
}
