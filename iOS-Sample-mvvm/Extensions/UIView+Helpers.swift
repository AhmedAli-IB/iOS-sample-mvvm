//
//  UIView+Helpers.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 24/01/2021.
//

import UIKit

/// UIView Class Methods
///
extension UIView {
    
    /// Returns the Nib associated with the received: It's filename is expected to match the Class Name
    ///
    class func loadNib() -> UINib {
        return UINib(nibName: classNameWithoutNamespaces, bundle: nil)
    }
    /// Make view as card
    ///
    func makeCardView(shadowOpacity: Float = Float(0.2),
                      shadowRadius: CGFloat =  CGFloat(4),
                      cornerRadius: CGFloat =  CGFloat(8) ) {
        backgroundColor = .white
        clipsToBounds = true
        layer.masksToBounds = false
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = shadowRadius
        layer.cornerRadius = cornerRadius
    }
    
    class func fromNib<T: UIView>() -> T {
        // swiftlint:disable force_cast
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)?.first as! T
    }

}
