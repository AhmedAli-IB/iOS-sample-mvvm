//
//  ChatViewController.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 21/01/2021.
//

import UIKit

class ChatViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
}

// MARK: - Configuration
//
private extension ChatViewController {
    
    /// Configure View
    ///
    func configureView() {
        self.title = Strings.title
    }
}

// MARK: - Strings
//
private extension ChatViewController {
    
    enum Strings {
        static let title = "Chat"
    }
}
