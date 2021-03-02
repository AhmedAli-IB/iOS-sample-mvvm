//
//  AccountViewController.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 21/01/2021.
//

import UIKit

class AccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }

}
// MARK: - Configuration
//
private extension AccountViewController {
    
    /// Configure View
    ///
    func configureView() {
        self.title = Strings.title
    }
}

// MARK: - Strings
//
private extension AccountViewController {
    
    enum Strings {
        static let title = "Account".localized
    }
}
