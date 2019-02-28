

import UIKit

class MessageViewController: UIViewController {
    
    private var message: Message
    private var sender: MessageSender
    init(message: Message, sender: MessageSender) {
        self.message = message
        self.sender = sender
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MessageDetailViewController: UIViewController {
    private var message: Message
    
//    typealias Factory = ViewControllerFactory
//    private let factory: Factory
    
    init(message: Message) {
        self.message = message
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MessageLoader: NSObject {
    init(networkManager: NetworkManager) {
        
    }
}

class MessageSender: NSObject {
    init(networkManager: NetworkManager) {
        
    }
}





protocol ThirdMainViewControllerDelegate: class {
    func didSelectModel()
}

/// Later 

class ThirdMainViewController: UIViewController {
    
    typealias Factory = ViewControllerFactoryProtocol & NetworkBoundFactoryProtocol
    private var factory: Factory?
    
    weak var delegate: ThirdMainViewControllerDelegate?
    
    func setFactory(factory: Factory) {
        self.factory = factory
    }
    
    func refresh() {
        self.factory?.makeNetworkManager().fetchMessages(handler: { (messages) in
            guard let factory = factory else { return }
            let messageListViewController = factory.makeMessageListViewController(with: messages)
            navigationController?.pushViewController(messageListViewController, animated: true)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        refresh()
    }
}
