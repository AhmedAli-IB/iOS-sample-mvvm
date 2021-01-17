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
    }
}
// MARK: - Strings
//
private extension HomeViewController {
    
    enum Strings {
        static let title = "Home"
    }
}
