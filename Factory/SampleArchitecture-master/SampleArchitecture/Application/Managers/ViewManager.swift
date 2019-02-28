

import Foundation
import UIKit

protocol ViewManagerProtocol {
    func start()
}

/*
 View Manager manages tab bar and coordinators
 View Hierarchy
 Listens for view related events e.g. login, logout, transaction detail, etc
*/
class ViewManager: NSObject {
    
    // MARK: - Coordinators
    var baseTabBarController: TabBarController!
    
    var firstCoordinator = FirstTabCoordinator()
    var secondCoordinator = SecondTabCoordinator()
    var thirdCoordinator = ThirdTabCoordinator()
    
    // MARK: - Properties
    var window: UIWindow?
    
    typealias Factory = ViewManagerFactoryProtocol & StoryboardManagerProtocol & ViewControllerFactoryProtocol
    private var factory: Factory
    
    init(factory: Factory) {
        self.factory = factory
    }
    
}

extension ViewManager: ViewManagerProtocol {
    func start() {
        // Setup Main View
        setupMainApp()
    }
}

// MARK: - Main Setup
extension ViewManager {
    private func setupMainApp() {
        baseTabBarController = factory.getTabBarController()
        setRootViewController(baseTabBarController)
    }
}

// MARK: - Helper Functions

extension ViewManager {
    private func setRootViewController(_ vc: UIViewController) {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = vc
    }
}

// MARK: Events Observed

extension ViewManager {
    @objc private func notificationReceived(info: Notification) {
        
    }
}

// MARK: Tab Bar Crap

extension ViewManager {
    
}
