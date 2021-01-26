//
//  UIView+Extention.swift
//  iOS-Sample-mvvm
//
//  Created by Aya Essam on 26/01/2021.
//

import UIKit

extension UIView {
  func loadViewFromNib<T: UIView>() -> T? {
    guard let contentView = Bundle(for: type(of: self))
        .loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?
        .first as? T else {
      // xib not loaded, or its top view is of the wrong type
      return nil
    }
    return contentView
  }
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
}

