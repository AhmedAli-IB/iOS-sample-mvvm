//
//  NotificationCoordinator.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 21/01/2021.
//

import UIKit

// MARK: - NotificationCoordinator
//
final class NotificationCoordinator: Coordinator {
    
    // MARK: - Properties
    //
    var navigationController: UINavigationController
    
    // MARK: - Init
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Handlers
    //
    func start() {
        print("start")
    }
}
