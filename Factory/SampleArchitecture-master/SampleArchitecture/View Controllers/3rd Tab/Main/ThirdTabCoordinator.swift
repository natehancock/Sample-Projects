
import Foundation
import UIKit



class ThirdTabCoordinator: NavCoordinator {
    
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

// MARK: - Navigation
extension ThirdTabCoordinator {
    private func presentDetail() {
        
    }
}

extension ThirdTabCoordinator: ThirdMainViewControllerDelegate {
    func didSelectModel() {
        
    }
}
