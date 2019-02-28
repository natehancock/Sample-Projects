

import Foundation
import UIKit

class MessageListViewController: UIViewController {
    
    typealias Factory = MessageLoaderFactory & ViewControllerFactoryProtocol
    private let factory: Factory
    
    private lazy var loader = factory.makeMessageLoader()
    
    
    var tableView: UITableView!
    
    
    init(factory: Factory, messages: [Message]) {
        self.factory = factory
        super.init(nibName: nil, bundle: nil)
        tableView = UINib.init(nibName: "MessageListViewController", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! MessageListTableView
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
