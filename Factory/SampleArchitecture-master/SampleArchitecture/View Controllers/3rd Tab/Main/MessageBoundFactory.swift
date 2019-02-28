

import Foundation
import UIKit

class MessageBoundFactory {
    private let message: Message
    typealias Factory = MessageBoundFactoryProtocol
    
    private let rootFactory: Factory
    
    init(message: Message, rootFactory: Factory) {
        self.message = message
        self.rootFactory = rootFactory
    }
    
    func makeMessageDetailViewController() -> UIViewController {
        return MessageDetailViewController(message: message)
    }
}
