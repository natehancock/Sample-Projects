

import Foundation
import UIKit


protocol MessageBoundFactoryProtocol {
    func makeMessageBoundFactory(for message: Message) -> MessageBoundFactory
}

protocol MessageLoaderFactory {
    func makeMessageLoader() -> MessageLoader
}

protocol NetworkBoundFactoryProtocol {
    func makeNetworkManager() -> NetworkManager
}
