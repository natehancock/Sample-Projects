

import Foundation
import UIKit

/// Handles instantiation of ViewControllers from Storyboards.
class StoryboardManager {

    enum Storyboards: String {
        case main = "Main"
        case firstTab = "FirstTab"
        case secondTab = "SecondTab"
        case thirdTab = "ThirdTab"
    }
    
    enum ViewControllers {
        enum firstTab: String {
            case main = "FirstMainViewController"
        }
        
        enum secondTab: String {
            case main = ""
        }
        
        enum thirdTab: String {
            case main = "ThirdViewController"
        }
    }
    
    
    typealias Factory = StoryboardManagerProtocol & NetworkManagerProtocol & ViewControllerFactoryProtocol
    
    private var factory: Factory
    
    init(factory: Factory) {
        self.factory = factory
    }
    
    typealias StoryboardIdentifier = Storyboards
    
    private func loadViewController<ViewControllerIdentifier: RawRepresentable>(storyboard: StoryboardIdentifier, viewController: ViewControllerIdentifier) -> UIViewController where ViewControllerIdentifier.RawValue == String {
        return UIStoryboard.init(name: storyboard.rawValue, bundle: nil).instantiateViewController(withIdentifier: viewController.rawValue)
    }
    
    func defaultNavController(rootVC: UIViewController) -> UINavigationController {
        let navController = UINavigationController(rootViewController: rootVC)
        navController.navigationBar.isOpaque = true
        navController.navigationBar.isTranslucent = false
        navController.view.backgroundColor = .white
        navController.extendedLayoutIncludesOpaqueBars = true
        return navController
    }
    
}
// MARK: - First Tab

extension StoryboardManager {
    func firstTabMain<T: FirstMainViewControllerDelegate>(with coordinator: T) -> UIViewController {
        let vc = loadViewController(storyboard: Storyboards.firstTab, viewController: ViewControllers.firstTab.main) as! FirstMainViewController
        vc.delegate = coordinator
        vc.title = "FirstMainViewController"
        
        let nav = defaultNavController(rootVC: vc)
        nav.tabBarItem.title = "First"
        
        return nav
    }
}

// MARK: - Second Tab

extension StoryboardManager {
    func secondTabMain<T: SecondMainViewControllerDelegate>(with coordinator: T) -> SecondMainViewController {
        let vc = SecondMainViewController()
        vc.delegate = coordinator
        vc.tabBarItem.title = "Second"
        return vc
    }
}

// MARK: - Third Tab

