//
//  NotificationViewController.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 21/01/2021.
//

import UIKit

class NotificationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }

}

// MARK: - Configuration
//
private extension NotificationViewController {
    
    /// Configure View
    ///
    func configureView() {
        self.title = Strings.title
    }
}

// MARK: - Strings
//
private extension NotificationViewController {
    
    enum Strings {
        static let title = "Notification"
    }
}
