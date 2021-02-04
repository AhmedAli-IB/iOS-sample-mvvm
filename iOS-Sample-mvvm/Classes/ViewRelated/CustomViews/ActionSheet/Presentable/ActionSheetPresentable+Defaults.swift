//
//  ActionSheetPresentable+Defaults.swift
//  BottomActionSheet
//
//  Created by Ahmed-Ali on 12/20/20.
//  Copyright © 2020 Ahmed-Ali. All rights reserved.
//

import UIKit

/**
 Default values for the PanModalPresentable.
 */
public extension ActionSheetPresentable where Self: UIViewController {

    var topOffset: CGFloat {
        return 30
    }

    var contentFormHeight: CGFloat {

        guard let scrollView = panScrollable else {
            return .zero
        }

        // called once during presentation and stored
        scrollView.layoutIfNeeded()
        return scrollView.contentSize.height
    }
    
    var longFormHeight: CGFloat {
        return view.frame.size.height * 0.75
    }
    
    var cornerRadius: CGFloat {
        return CGFloat(10.0)
    }
    
    var allowsTapToDismiss: Bool {
        return true
    }
    
    var allowsDragToDismiss: Bool {
        return true
    }
    
    var showDragIndicator: Bool {
        return true
    }
    
    var dragIndicatorBackgroundColor: UIColor {
        return .darkGray
    }
    
    var allowsExtendedPanScrolling: Bool {
        return true
    }
    
}
