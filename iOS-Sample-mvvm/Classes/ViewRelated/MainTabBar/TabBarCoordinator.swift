//
//  TabBarCoordinator.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 22/02/2021.
//

import UIKit

// MARK: - TabBarCoordinator
//
final class TabBarCoordinator: Coordinator {
    // MARK: - Properties
    //
    var navigationController: UINavigationController
    /// Controllers
    ///
    /// HomeViewController
    ///
    private lazy var homeViewController: UIViewController = {
        let navigationController = BaseNavigationController()
        HomeCoordinator(navigationController: navigationController).start()
        let tabBarItem = UITabBarItem(title: nil,
                                      image: Asset.Assets.icHomeActive.image,
                                      selectedImage: Asset.Assets.icHomeDot.image)
        tabBarItem.setImageOnly()
        
        navigationController.tabBarItem = tabBarItem
        return navigationController
    }()
    /// ChatViewController
    ///
    private lazy var chatViewController: UIViewController = {
        let navigationController = BaseNavigationController()
        ChatCoordinator(navigationController: navigationController).start()
        let tabBarItem = UITabBarItem(title: nil,
                                      image: Asset.Assets.icChat.image,
                                      selectedImage: Asset.Assets.icChat.image)
        tabBarItem.setImageOnly()
        
        navigationController.tabBarItem = tabBarItem
        return navigationController
    }()
    
    /// NotificationsViewController
    ///
    private lazy var notificationViewController: UIViewController = {
        let navigationController = BaseNavigationController()
        NotificationCoordinator(navigationController: navigationController).start()
        let tabBarItem = UITabBarItem(title: nil,
                                      image: Asset.Assets.icNotificationActiveRed.image,
                                      selectedImage: Asset.Assets.item3.image)
        
        tabBarItem.setImageOnly()
        navigationController.tabBarItem = tabBarItem
        return navigationController
    }()
    
    /// AccountViewController
    ///
    private lazy var accountViewController: UIViewController = {
        let navigationController = BaseNavigationController()
        AccountCoordinator(navigationController: navigationController).start()
        let tabBarItem = UITabBarItem(title: nil,
                                      image: Asset.Assets.icInactiveProfile.image,
                                      selectedImage: Asset.Assets.icInactiveProfile.image)
        tabBarItem.setImageOnly()
        navigationController.tabBarItem = tabBarItem
        return navigationController
    }()
    
    // MARK: - Init
    //
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
        let tabBarController = MainTabBarController()
        
        /// Show tab bar
        ///
        navigationController.setViewControllers([tabBarController], animated: true)

        tabBarController.viewControllers = {
            var controllers = tabBarController.viewControllers ?? []
            
            let homeTabIndex = AppTab.home.visibleIndex()
            controllers.insert(homeViewController, at: homeTabIndex)
            
            let chatIndex = AppTab.chat.visibleIndex()
            controllers.insert(chatViewController, at: chatIndex)
            
            let notificationIndex = AppTab.notification.visibleIndex()
            controllers.insert(notificationViewController, at: notificationIndex)
            
            let accountIndex = AppTab.account.visibleIndex()
            controllers.insert(accountViewController, at: accountIndex)
            
            return controllers
        }()
    }
}