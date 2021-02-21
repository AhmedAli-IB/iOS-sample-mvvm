//
//  UITableViewHeaderFooterView+Helpers.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 21/02/2021.
//

import UIKit

/// UITableViewHeaderFooterView Helpers
///
extension UITableViewHeaderFooterView {

    /// Returns a reuseIdentifier that matches the receiver's classname (non namespaced).
    ///
    class var reuseIdentifier: String {
        return classNameWithoutNamespaces
    }
}
