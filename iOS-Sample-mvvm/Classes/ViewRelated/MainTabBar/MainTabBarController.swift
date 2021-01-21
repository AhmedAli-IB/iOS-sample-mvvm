//
//  MainTabBarController.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 21/01/2021.
//

import UIKit

// MARK: - MainTabBarController
//
class MainTabBarController: UITabBarController {
    
    // MARK: - Properties
    /// Controllers
    ///
    /// HomeViewController
    ///
    private lazy var homeViewController: UIViewController = {
        let navigationController = UINavigationController()
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
        let navigationController = UINavigationController()
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
        let navigationController = UINavigationController()
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
        let navigationController = UINavigationController()
        AccountCoordinator(navigationController: navigationController).start()
        let tabBarItem = UITabBarItem(title: nil,
                                      image: Asset.Assets.icInactiveProfile.image,
                                      selectedImage: Asset.Assets.icInactiveProfile.image)
        tabBarItem.setImageOnly()
        navigationController.tabBarItem = tabBarItem
        return navigationController
    }()
    
    // MARK: - Lifecycle
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = Asset.ColorPalette.blue50.color
        // call this to refresh status bar changes happening at runtime
        setNeedsStatusBarAppearanceUpdate()
        // Add Tabs
        viewControllers = {
            var controllers = viewControllers ?? []
            
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
