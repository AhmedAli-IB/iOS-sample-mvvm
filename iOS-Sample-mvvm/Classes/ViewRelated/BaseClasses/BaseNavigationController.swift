//
//  BaseNavigationController.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 24/01/2021.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {

        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAppearance()
        
    }
    
}

private extension BaseNavigationController {
    /// hide navigation bar
    ///
    func configureAppearance() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        self.navigationBar.isTranslucent = true
        self.navigationBar.shadowImage = UIImage()
    }
}
