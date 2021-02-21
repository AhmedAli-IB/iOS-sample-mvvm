//
//  HomeCoordinator.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 21/01/2021.
//

import UIKit

// MARK: - HomeCoordinatorProtocol
/// `HomeCoordinatorProtocol` responsable for navigation logic in home flow
///
protocol HomeCoordinatorProtocol: class {
    func pushSerchViewController()
    func popViewController()

    /// Show bottom action sheet with view controller
    /// - Parameters:
    ///   - currentView: currentView
    ///   - viewController:  view controller that conform to ActionSheetPresentable
    func showActionSheet(_ currentView: UIView, _ viewController: UIViewController & ActionSheetPresentable)
}
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

// MARK: - HomeCoordinator + HomeCoordinatorProtocol
//
extension HomeCoordinator: HomeCoordinatorProtocol {
    
    func showActionSheet(_ currentView: UIView, _ viewController: UIViewController & ActionSheetPresentable) {
        let cardVC = CardViewController(viewController: viewController)
        
        // set the modal presentation to full screen, in iOS 13, its no longer full screen by default
        cardVC.modalPresentationStyle = .fullScreen
        
        // take a snapshot of current view and set it as backingImage
        cardVC.backingImage = currentView.asImage()
        
        // present the view controller modally without animation
        self.navigationController.present(cardVC, animated: false, completion: nil)
    }

    func popViewController() {
        self.navigationController.popViewController(animated: true)
    }
    
    func pushSerchViewController() {
        let vc = SearchPepoleViewController()
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: true)
    }
    
}
