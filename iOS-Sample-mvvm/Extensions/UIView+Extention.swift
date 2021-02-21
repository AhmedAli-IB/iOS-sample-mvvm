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
    
}
