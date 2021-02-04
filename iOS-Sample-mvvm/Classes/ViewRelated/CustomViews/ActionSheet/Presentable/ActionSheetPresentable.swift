//
//  ActionSheetPresentable.swift
//  BottomActionSheet
//
//  Created by Ahmed-Ali on 12/20/20.
//  Copyright © 2020 Ahmed-Ali. All rights reserved.
//

import UIKit

/**
 This is the configuration object for a view controller
 that will be presented using the PanModal transition.

 Usage:
 ```
 extension YourViewController: PanModalPresentable {
    func shouldRoundTopCorners: Bool { return false }
 }
 ```
 */
public protocol ActionSheetPresentable: AnyObject {

    /**
     The scroll view embedded in the view controller.
     Setting this value allows for seamless transition scrolling between the embedded scroll view
     and the pan modal container view.
     */
    var panScrollable: UIScrollView? { get }

    /**
     The offset between the top of the screen and the top of the pan modal container view.

     Default value is the topLayoutGuide.length + 21.0.
     */
    var topOffset: CGFloat { get }

    /**
     The height of the pan modal container view
     when in the longForm presentation state.
     
     This value is capped to .max, if provided value exceeds the space available.

     Default value is  CGFloat of  app  windo - 30
     */
    var longFormHeight: CGFloat { get }
    
    /**
     The height of the pan modal container view
     when in the longForm presentation state.
     
     This value is capped to .max, if provided value exceeds the space available.

     Default value is  panScrollable.contentsize.height
     Must override this property when scroll view == nil
     */
    
    var contentFormHeight: CGFloat { get }

    /**
     Should reload card content.
     */
    var shouldReloadContent: (() -> Void)? { get set }

    /**
     The corner radius used when `shouldRoundTopCorners` is enabled.

     Default Value is 10.0.
     */
    var cornerRadius: CGFloat { get }

    /**
     The drag indicator view color.

     Default value is light gray.
    */
    var dragIndicatorBackgroundColor: UIColor { get }

    /**
     A flag to determine if scrolling should seamlessly transition from the pan modal container view to
     the embedded scroll view once the scroll limit has been reached.

     Default value is false. Unless a scrollView is provided and the content height exceeds the longForm height.
     */
    var allowsExtendedPanScrolling: Bool { get }

    /**
     A flag to determine if dismissal should be initiated when swiping down on the presented view.

     Return false to fallback to the short form state instead of dismissing.

     Default value is true.
     */
    var allowsDragToDismiss: Bool { get }

    /**
     A flag to determine if dismissal should be initiated when tapping on the dimmed background view.

     Default value is true.
     */
    var allowsTapToDismiss: Bool { get }

    /**
     A flag to determine if a drag indicator should be shown
     above the pan modal container view.

     Default value is true.
     */
    var showDragIndicator: Bool { get }

}
