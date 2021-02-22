//
//  ApplicationCoordinator.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 21/01/2021.
//

import UIKit

class ApplicationCoordinator: Coordinator {
    
    // MARK: - Properties
    
    private weak var window: UIWindow?
    
    let navigationController: UINavigationController
    
    var coordinator: Coordinator!
    
    // MARK: - init
    //
    init(window: UIWindow?, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.window = window
    }
    
    func start() {
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        setLaunchInstructor()
    }
}
// MARK: - Handlers
//
private extension ApplicationCoordinator {
        
    /// set root view controller
    ///
    func setLaunchInstructor() {
            runHomeFlow()
    }
        
    /// Run home  flow
    func runHomeFlow() {
//        let viewController = MainTabBarController()
//        window?.rootViewController = viewController
//        window?.makeKeyAndVisible()
        
        let startCoordinator = TabBarCoordinator(navigationController: navigationController)
        startCoordinator.start()

    }
}
