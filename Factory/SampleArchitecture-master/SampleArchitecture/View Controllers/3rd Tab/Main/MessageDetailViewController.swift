

import UIKit


class MessageDetailViewController: UIViewController {
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    typealias Factory = NetworkManagerProtocol
    private var factory: Factory!
    
    var message: Message?
    
    func setFactory(_ factory: Factory) {
        self.factory = factory
    }
    
    func setMessage(with message: Message) {
        self.message = message
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refresh()
    }
    
    func refresh() {
        guard let message = message else { return }
        mainLabel.text = message.text
        detailLabel.text = message.subtext
    }
}
