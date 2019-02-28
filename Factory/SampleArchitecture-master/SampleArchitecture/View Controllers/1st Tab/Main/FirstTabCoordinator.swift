

import Foundation
import UIKit

class FirstTabCoordinator: NavCoordinator {

    // MARK: - Properties
    
    var navController: UINavigationController?
    
    deinit {
        navController = nil
    }
    
    // MARK: - Navigation
    
    /// Present a VC modally
    private func present(vc: UIViewController) {
        navController?.present(vc, animated: true, completion: nil)
    }
    
    /// Adding a view controller to the stack
    private func push(vc: UIViewController) {
        navController?.pushViewController(vc, animated: true)
    }
    
    func stackViewControllers(vcs: [UIViewController]) {
        navController?.setViewControllers(vcs, animated: true)
    }
}

extension FirstTabCoordinator {
    private func presentDetail(with contact: Contact) {
        
    }
}

extension FirstTabCoordinator: FirstMainViewControllerDelegate {
    func didSelectModel(model: Contact) {
        presentDetail(with: model)
    }
}
