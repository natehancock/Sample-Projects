
import Foundation
import UIKit



class ThirdTabCoordinator: NavCoordinator {
    
    // MARK: - Properties
    
    var navController: UINavigationController?
    
    typealias Factory = ViewControllerFactoryProtocol
    
    private var factory: Factory
    
    init(factory: Factory) {
        self.factory = factory
    }
    
    deinit {
        navController = nil
    }
}

// MARK: - Navigation
extension ThirdTabCoordinator: MessageListViewControllerProtocol {
    func didSelectMessage(_ message: Message) {
        let vc = factory.getMessageDetailViewController(for: message)
        push(vc: vc)
    }

}
