//
//  HomeViewController.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 17/01/2021.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

}

// MARK: - Configuration
//
private extension HomeViewController {
    
    ///Configure View
    ///
    func configureView() {
        self.title = Strings.title
        self.navigationController?.navigationBar.barTintColor = Asset.ColorPalette.blue0.color
        setupNavigationBarFont()

    }
    /// Setup navigation bar font
    ///
    func setupNavigationBarFont() {
        let navigationBar =  self.navigationController?.navigationBar
        let mediumFont = FontFamily._29LTAzer.medium.font(size: Constants.fontSize)
        navigationBar?.titleTextAttributes = [NSAttributedString.Key.font: mediumFont]
     }
}
// MARK: - Strings
//
private extension HomeViewController {
    
    enum Strings {
        static let title = "Home"
    }
}

// MARK: - Constants
//
private extension HomeViewController {
    
    enum Constants {
        static let fontSize = CGFloat(22.0)
    }
}
