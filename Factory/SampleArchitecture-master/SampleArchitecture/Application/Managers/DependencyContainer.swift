

import Foundation
import UIKit

protocol ViewControllerFactoryProtocol {
    func getTabBarController() -> TabBarController
    func getFirstMainViewController() -> UINavigationController
    func getSecondMainViewController() -> UINavigationController
    func getMessageListViewController(with messages: [Message]?) -> MessageListViewController
//    func makeMessageViewController(for message: Message) -> MessageViewController
}

/// Protocol to conform to if need access to loading ViewControllers from Storyboards.
protocol StoryboardManagerProtocol {
    func getStoryboardManager() -> StoryboardManager
}

/// Protocol to conform to if need access to the View Manager
protocol ViewManagerFactoryProtocol {
    func getViewManager() -> ViewManager
}

protocol NetworkManagerProtocol {
    func getNetworkManager() -> NetworkManager
}


/// Class that has access to all dependencies in app
class DependencyContainer {
    private lazy var networkManager = NetworkManager()
    private lazy var viewManager =  ViewManager(factory: self)
    private lazy var storyboardManager = StoryboardManager(factory: self)
    
    private lazy var firstCoordinator = FirstTabCoordinator()
    private lazy var secondCoordinator = SecondTabCoordinator()
    private lazy var thirdCoordinator = ThirdTabCoordinator()
}

extension DependencyContainer: ViewManagerFactoryProtocol {
    func getViewManager() -> ViewManager {
        return viewManager
    }
}

extension DependencyContainer: StoryboardManagerProtocol {
    func getStoryboardManager() -> StoryboardManager {
        return storyboardManager
    }
}

extension DependencyContainer: NetworkManagerProtocol {
    func getNetworkManager() -> NetworkManager {
        return networkManager
    }
}

extension DependencyContainer: ViewControllerFactoryProtocol {
    
    func getTabBarController() -> TabBarController {
        let tabBarController = TabBarController()
        tabBarController.viewControllers = [getMessageListViewController(with: [])]
        return tabBarController
    }
    
    func getFirstMainViewController() -> UINavigationController {
        return UINavigationController()
    }
    
    func getSecondMainViewController() -> UINavigationController {
        return UINavigationController()
    }
    
    func getMessageListViewController(with messages: [Message]?) -> MessageListViewController {
        return MessageListViewController(factory: self, messages: messages)
    }
    
//    func makeMessageViewController(for message: Message) -> MessageViewController {
//        return MessageViewController(message: message, sender: messageSender)
//    }
}
