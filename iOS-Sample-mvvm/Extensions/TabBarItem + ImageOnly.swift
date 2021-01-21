//
//  TabBarItem + ImageOnly.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 21/01/2021.
//

import UIKit

/// UITabBarItem hide title and show image only
///
extension UITabBarItem {
    func setImageOnly() {
        imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -9, right: 0)
        setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .selected)
        setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .normal)
    }
 }
