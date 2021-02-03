//
//  CardViewController.swift
//  BottomActionSheet
//
//  Created by Ahmed-Ali on 12/17/20.
//  Copyright © 2020 Ahmed-Ali. All rights reserved.
//

import UIKit

class CardViewController: BaseViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var backingImageView: UIImageView!
    @IBOutlet private weak var dimmerView: UIView!
    @IBOutlet private weak var handleView: UIView!
    @IBOutlet private weak var cardView: UIView!
    @IBOutlet private weak var contentView: UIView!
    //
    @IBOutlet private weak var cardTopConstraint: NSLayoutConstraint!
    
    // MARK: - Properties
    
    var backingImage: UIImage?
    
    private var isFirstAppear: Bool = true
    
    private var cardViewState: CardViewState = .normal
    // to store the card view top constraint value before the dragging start
    // default is 30 pt from safe area top
    lazy var cardPanStartingTopConstant: CGFloat = childViewController.topOffset
    
    private weak var childViewController: (UIViewController & ActionSheetPresentable)!
    
    // MARK: - Lifecycle
    
    required init(viewController: UIViewController & ActionSheetPresentable) {
        
        self.childViewController = viewController
        // set the modal presentation to full screen, in iOS 13, its no longer full screen by default
        super.init(nibName: nil, bundle: nil)
        
        self.modalPresentationStyle = .overCurrentContext
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewContent()
        configureView()
        addTapGestureRecognizer()
        addPanGestureRecognizer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showCard()
    }
}

// MARK: - Configure View
//
private extension CardViewController {
    
    func configureView() {
        
        // put snapshot of previous view as backround
        backingImageView.image = backingImage
        
        // set  top right and left corner
        cardView.clipsToBounds = true
        cardView.layer.cornerRadius = childViewController.cornerRadius
        cardView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        // handleView
        
        handleView.clipsToBounds = true
        handleView.isHidden = !childViewController.showDragIndicator
        handleView.layer.cornerRadius = 3.0
        handleView.backgroundColor = childViewController.dragIndicatorBackgroundColor
        
        //
        // hide the card view at the bottom when the View first load
        //        guard let safeAreaHeight = safeAreaHeight, let bottomPadding = bottomPadding else {return}
        cardTopConstraint.constant = safeAreaHeight + bottomPadding
        
        // set dimmerview to transparent
        dimmerView.alpha = 0.0
        
        configureChildViewController()
    }
    
    // Setup Child View Controller
    private func configureChildViewController() {
        
        addChild(childViewController)
        
        childViewController.view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(childViewController.view)
        NSLayoutConstraint.activate([
            childViewController.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            childViewController.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            childViewController.view.topAnchor.constraint(equalTo: contentView.topAnchor),
            childViewController.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        childViewController.didMove(toParent: self)
    }
    
    /// Bind  on change content in child view controller
    ///
    func bindViewContent() {
        childViewController.shouldReloadContent = {
            self.calculateCardIntialHeight()
        }
    }
    
}

// MARK: - Animations
//
private extension CardViewController {
    
    private func showCard(atState: CardViewState = .normal) {
        // ensure there's no pending layout changes before animation runs
        self.view.layoutIfNeeded()
        
        // set the new top constraint value for card view
        // card view won't move up just yet, we need to call layoutIfNeeded()
        // to tell the app to refresh the frame/position of card view
        
        if atState == .expanded {
            // if state is expanded, top constraint is 30pt away from safe area top
            cardTopConstraint.constant = childViewController.topOffset
        } else {
            calculateCardIntialHeight()
        }
        
        cardPanStartingTopConstant = cardTopConstraint.constant
        // move card up from bottom
        // create a new property animator
        let showCard = UIViewPropertyAnimator(duration: 0.25, curve: .easeIn, animations: {
            self.view.layoutIfNeeded()
        })
        
        // show dimmer view
        // this will animate the dimmerView alpha together with the card move up animation
        showCard.addAnimations {
            self.dimmerView.alpha = 0.7
        }
        
        // run the animation
        showCard.startAnimation()
    }
    
    // ReactionViewController.swift
    private func hideCardAndGoBack() {
        
        // ensure there's no pending layout changes before animation runs
        self.view.layoutIfNeeded()
        
        // set the new top constraint value for card view
        // card view won't move down just yet, we need to call layoutIfNeeded()
        // to tell the app to refresh the frame/position of card view
        // move the card view to bottom of screen
        
        cardTopConstraint.constant = safeAreaHeight + bottomPadding
        
        // move card down to bottom
        // create a new property animator
        let hideCard = UIViewPropertyAnimator(duration: 0.25, curve: .easeIn, animations: {
            self.view.layoutIfNeeded()
        })
        
        // hide dimmer view
        // this will animate the dimmerView alpha together with the card move down animation
        hideCard.addAnimations {
            self.dimmerView.alpha = 0.0
        }
        
        // when the animation completes, (position == .end means the animation has ended)
        // dismiss this view controller (if there is a presenting view controller)
        hideCard.addCompletion({ position in
            if position == .end {
                if(self.presentingViewController != nil) {
                    self.dismiss(animated: false, completion: nil)
                }
            }
        })
        
        // run the animation
        hideCard.startAnimation()
    }
}
// MARK: - Handlers
//
private extension CardViewController {
    
    /// Add tap gesture recognizer to dissmiss bottom card view
    ///
    func addTapGestureRecognizer() {
        let dimmerTap = UITapGestureRecognizer(target: self, action: #selector(dimmerViewTapped(_:)))
        dimmerView.addGestureRecognizer(dimmerTap)
        dimmerView.isUserInteractionEnabled = true
    }
    
    @objc
    func dimmerViewTapped(_ tapRecognizer: UITapGestureRecognizer) {
        
        if childViewController.allowsTapToDismiss {
            hideCardAndGoBack()
        }
    }
    
    func addPanGestureRecognizer() {
        
        // add pan gesture recognizer to the view controller's view (the whole screen)
        let viewPan = UIPanGestureRecognizer(target: self, action: #selector(viewPanned(_:)))
        
        // by default iOS will delay the touch before recording the drag/pan information
        // we want the drag gesture to be recorded down immediately, hence setting no delay
        viewPan.delaysTouchesBegan = false
        viewPan.delaysTouchesEnded = false
        self.view.addGestureRecognizer(viewPan)
    }
    
    // this function will be called when user pan/drag the view
    @objc
    func viewPanned(_ panRecognizer: UIPanGestureRecognizer) {
        // how much distance has user dragged the card view
        // positive number means user dragged downward
        // negative number means user dragged upward
        if childViewController.allowsDragToDismiss {
            
            let translation = panRecognizer.translation(in: self.view)
            let velocity = panRecognizer.velocity(in: self.view)
            
            switch panRecognizer.state {
            case .began:
                cardPanStartingTopConstant = cardTopConstraint.constant
            case .changed :
                if self.cardPanStartingTopConstant + translation.y > 30.0 {
                    self.cardTopConstraint.constant = self.cardPanStartingTopConstant + translation.y
                }
            case .ended :
                
                // if user drag down with a very fast speed (ie. swipe)
                if velocity.y > 1500.0 {
                    // hide the card and dismiss current view controller
                    hideCardAndGoBack()
                    return
                }
                if self.cardTopConstraint.constant < (safeAreaHeight + bottomPadding) * 0.25 {
                    showCard(atState: .expanded)
                } else if self.cardTopConstraint.constant < (safeAreaHeight) - 70 {
                    // show the card at normal state
                    showCard()
                } else {
                    // hide the card and dismiss current view controller
                    hideCardAndGoBack()
                }
                
            default:
                break
            }
        }
    }
    
    /// Calculate card  content size
    ///
    func calculateCardIntialHeight() {
        
        let contentHeight = childViewController.contentFormHeight
        let maxHeight = safeAreaHeight + bottomPadding - childViewController.topOffset
        
        guard contentHeight < maxHeight else {
            cardTopConstraint.constant = childViewController.topOffset
            return
        }
        if isFirstAppear {
            cardTopConstraint.constant =  (safeAreaHeight + bottomPadding) / 2.0
            isFirstAppear = false
            return
        }
        cardTopConstraint.constant = (safeAreaHeight + /*bottomPadding*/ 0) - contentHeight
    }
    
}

// MARK: - Helpers
//
private extension CardViewController {
    
    var safeAreaHeight: CGFloat {
        return UIApplication.shared.keyWindow?
            .safeAreaLayoutGuide.layoutFrame.size.height ?? .zero
    }
    
    var bottomPadding: CGFloat {
        return UIApplication.shared.keyWindow?
            .safeAreaInsets.bottom ?? .zero
    }
}

// MARK: - Card State
//
private extension CardViewController {
    
    enum CardViewState {
        case expanded
        case normal
    }
}

// MARK: - UIApplication+KeyWindow
//
private extension UIApplication {
    
    var keyWindow: UIWindow? {
        return UIApplication.shared.windows.first(where: { $0.isKeyWindow })
    }
}
