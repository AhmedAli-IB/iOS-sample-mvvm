//
//  UIViewController.swift+Loadding+Alert.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 24/01/2021.
//

import UIKit

// MARK: - Loading
//
extension BaseViewController {

    func shouldShowProgressView(_ show: Bool) {
        DispatchQueue.main.async {
            show ? self.showActivityIndicator() : self.hideActivityIndicator()
        }
    }
    /// Show activity Indicator
    ///
    func showActivityIndicator() {
        
        activityView.color = .black
        activityView.center = self.view.center
        self.view.addSubview(activityView)
        activityView.startAnimating()

    }
    /// Hide activity indicator
    ///
    func hideActivityIndicator() {
        activityView.stopAnimating()
    }
}

// MARK: - Alert
//
extension UIViewController {
    
    typealias AlertHandler = ((UIAlertAction) -> Void)
    
    func showAlert(title: String? = nil,
                   message: String? = nil,
                   actions: UIAlertAction?...,
                   completion: (() -> Void)? = nil) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions
            .compactMap { $0 }
            .forEach { alertVC.addAction($0) }
        DispatchQueue.main.async {
            self.present(alertVC, animated: true, completion: completion)
        }
    }
    
    /// Show error Alert
    func showErrorAlert(error: String, handler: UIAlertAction? = nil) {
        let okAction = UIAlertAction(title: "OK", style: .default)
        showAlert(title: nil, message: error, actions: okAction, handler)
    }
}
