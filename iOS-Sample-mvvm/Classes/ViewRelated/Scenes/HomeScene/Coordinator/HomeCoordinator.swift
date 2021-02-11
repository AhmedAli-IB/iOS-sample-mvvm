//
//  HomeCoordinator.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 21/01/2021.
//

import UIKit

// MARK: - HomeCoordinator
//
final class HomeCoordinator: Coordinator {
    
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
        showHomeViewController()
    }
    /// Show home flow
    ///
    private func showHomeViewController() {
        let homeVC = HomeViewController()
        homeVC.coordinator = self
        self.navigationController.setViewControllers([homeVC], animated: false)
    }
}

protocol HomeCoordinatorProtocol {
    func pushSerchViewController()
    func popViewController()
}

extension HomeCoordinator: HomeCoordinatorProtocol {
    
    func popViewController() {
        self.navigationController.popViewController(animated: true)
    }
    
    func pushSerchViewController() {
        let vc = SearchPepoleViewController()
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: true)
    }
    
}
