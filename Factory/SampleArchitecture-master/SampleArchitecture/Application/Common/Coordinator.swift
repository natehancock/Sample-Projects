
import Foundation
import UIKit

typealias NavCoordinator = NSObject & Coordinator

protocol Coordinator {
    var navController: UINavigationController? { get set }
}

// Optional Methods (Default functionality) 
extension Coordinator {
    private func present(vc: UIViewController){
        navController?.present(vc, animated: true, completion: nil)
    }
    
    private func push(vc: UIViewController){
        navController?.pushViewController(vc, animated: true)
    }
    
    func stackViewControllers(vcs: [UIViewController]){
        navController?.setViewControllers(vcs, animated: true)
    }
}
