//
//  ChatCoordinator.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 21/01/2021.
//

import UIKit

// MARK: - ChatCoordinator
//
final class ChatCoordinator: Coordinator {
    
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
        showChatViewController()
    }
    /// Show showAccount flow
    ///
    private func showChatViewController() {
        let chatVC = ChatViewController()
        self.navigationController.setViewControllers([chatVC], animated: false)
    }
}
