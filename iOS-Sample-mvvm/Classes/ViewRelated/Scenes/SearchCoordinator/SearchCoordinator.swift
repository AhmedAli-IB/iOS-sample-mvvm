//
//  SearchCoordinator.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 24/01/2021.
//

import  UIKit
// MARK: - HomeCoordinator
//
final class SearchCoordinator: Coordinator {
    
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
    /// Show search flow
    ///
    private func showHomeViewController() {
        let searchC = SearchPepoleViewController()
        self.navigationController.setViewControllers([searchC], animated: false)
    }
}
