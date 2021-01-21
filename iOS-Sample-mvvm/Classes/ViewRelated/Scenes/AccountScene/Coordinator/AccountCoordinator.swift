//
//  AccountCoordinator.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 21/01/2021.
//

import UIKit

// MARK: - AccountCoordinator
//
final class AccountCoordinator: Coordinator {
    
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
        showAccountViewController()
    }
    /// Show showAccount flow
    ///
    private func showAccountViewController() {
        let accountVC = AccountViewController()
        self.navigationController.setViewControllers([accountVC], animated: false)
    }
}
