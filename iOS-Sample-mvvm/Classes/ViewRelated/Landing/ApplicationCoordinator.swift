//
//  ApplicationCoordinator.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 21/01/2021.
//

import UIKit

class ApplicationCoordinator {
    
    // MARK: - Properties
    
    private weak var window: UIWindow?
    
    let tabBarController: MainTabBarController = MainTabBarController()

    var coordinator: Coordinator!
    
    // MARK: - init
    //
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        window?.rootViewController = tabBarController
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
        let startCoordinator = TabBarCoordinator(tabBarController: tabBarController)
        startCoordinator.start()
    }
}
