//
//  MainTabBarController.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 21/01/2021.
//

import UIKit

// MARK: - MainTabBarController
//
class MainTabBarController: UITabBarController {

    // MARK: - Lifecycle
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        configureApperance()
    }
}

// MARK: - Configure Apperance
//
extension MainTabBarController {
    
    /// Configure Apperence
    ///
    func configureApperance() {
        self.tabBar.tintColor = Asset.ColorPalette.blue50.color
        setNeedsStatusBarAppearanceUpdate()
    }
}
