//
//  UIView+Snapshot.swift
//  BottomActionSheet
//
//  Created by Ahmed-Ali on 12/17/20.
//  Copyright © 2020 Ahmed-Ali. All rights reserved.
//

import UIKit

extension UIView {
    // render the view within the view's bounds, then capture it as image
  func asImage() -> UIImage {
    let renderer = UIGraphicsImageRenderer(bounds: bounds)
    return renderer.image(actions: { rendererContext in
        layer.render(in: rendererContext.cgContext)
    })
  }
}
