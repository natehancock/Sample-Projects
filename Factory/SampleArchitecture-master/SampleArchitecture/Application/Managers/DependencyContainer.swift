

import Foundation
import UIKit





protocol StoryboardManagerProtocol {
    func getStoryboardManager() -> StoryboardManager
}

protocol ViewManagerFactoryProtocol {
    func getViewManager() -> ViewManager
}

class DependencyContainer {
    private lazy var messageSender = MessageSender(networkManager: networkManager)
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

protocol ViewControllerFactoryProtocol {
    func getTabBarController() -> TabBarController
    func getFirstMainViewController() -> UINavigationController
    func getSecondMainViewController() -> UINavigationController
    func getThirdMainViewController() -> UINavigationController
    
    func makeMessageListViewController(with messages: [Message]) -> MessageListViewController
    func makeMessageViewController(for message: Message) -> MessageViewController
}

extension DependencyContainer: ViewControllerFactoryProtocol {
    
    func getTabBarController() -> TabBarController {
        let tabBarController = TabBarController()
        tabBarController.viewControllers = [getFirstMainViewController(), getSecondMainViewController(), getThirdMainViewController()]
        return tabBarController
    }
    
    func getFirstMainViewController() -> UINavigationController {
        return UINavigationController()
    }
    
    func getSecondMainViewController() -> UINavigationController {
        return UINavigationController()
    }
    
    func getThirdMainViewController() -> UINavigationController {
        let vc = storyboardManager.thirdTabMain()
        vc.delegate = thirdCoordinator
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem.title = "THIRD"
        return navController
    }
    
    func makeMessageListViewController(with messages: [Message]) -> MessageListViewController {
        return MessageListViewController(factory: self, messages: messages)
    }
    
    func makeMessageViewController(for message: Message) -> MessageViewController {
        return MessageViewController(message: message, sender: messageSender)
    }
}

extension DependencyContainer: MessageLoaderFactory {
    func makeMessageLoader() -> MessageLoader {
        return MessageLoader(networkManager: networkManager)
    }
}

extension DependencyContainer: MessageBoundFactoryProtocol {
    func makeMessageBoundFactory(for message: Message) -> MessageBoundFactory {
        return MessageBoundFactory(message: message, rootFactory: self)
    }
}

extension DependencyContainer: NetworkBoundFactoryProtocol {
    func makeNetworkManager() -> NetworkManager {
        return networkManager
    }
}


class NetworkManager: NSObject {
    
    
    func fetchMessages(handler: ([Message])->()) {
        let messages = [Message(with: "ONE"), Message(with: "TWO"), Message(with: "THREE"), Message(with: "4"), Message(with: "5"), Message(with: "6")]
        handler(messages)
    }
}
