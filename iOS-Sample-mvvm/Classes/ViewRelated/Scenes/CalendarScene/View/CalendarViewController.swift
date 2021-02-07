//
//  CalendarViewController.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 04/02/2021.
//

import UIKit
import FSCalendar

class CalendarViewController: BaseViewController {
    
    // MARK: - Properties
    //
    @IBOutlet private weak var submitButton: UIButton!
    @IBOutlet private weak var calendar: FSCalendar!
    
    // MARK: - Properties
    var shouldReload: (() -> Void)?
    
    // MARK: - Lifecycle
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        shouldReload?()
    }
}

 // MARK: - IBActions
 //
private extension CalendarViewController {
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

// MARK: - Configuration
//
private extension CalendarViewController {
    
     func configureCalendar() {
        // swiftlint:disable explicit_init
        calendar.locale = Locale.init(identifier: Strings.arabicIdentifer)
        calendar.allowsMultipleSelection = true
        calendar.appearance.selectionColor = Asset.ColorPalette.primaryColor.color
        calendar.appearance.headerTitleColor = Asset.ColorPalette.titleColor.color
        calendar.appearance.titleDefaultColor = Asset.ColorPalette.titleColor.color
        calendar.appearance.weekdayTextColor = Asset.ColorPalette.weakDatTextColor.color
    }
    
    /// Configure view
    ///
    func configureView() {
        configureCalendar()
        submitButton.layer.cornerRadius = Constants.buttonCornerRadius
                submitButton.titleLabel?.text = Strings.submmitButtonTitle
       submitButton.titleLabel?.font = FontFamily._29LTAzer.bold.font(size: Constants.buttonCornerFontSize)
        
    }
}

// MARK: - Conform PanModalPresentable
//
extension CalendarViewController: ActionSheetPresentable {
    
    var panScrollable: UIScrollView? { nil }
    
    var shouldReloadContent: (() -> Void)? {
        get {
            shouldReload
        }
        set {
            shouldReload = newValue
        }
    }
    var contentFormHeight: CGFloat {
        return  Constants.staticAdditionalHieghtForActionSheet
    }

    var dragIndicatorBackgroundColor: UIColor {
        return .white
    }
    
     var allowsTapToDismiss: Bool {
        return true
    }
    
    var cornerRadius: CGFloat {
        return CGFloat(Constants.actionSheetCornerRedius)
    }
}

// MARK: - Constants
//
private extension CalendarViewController {
    enum Constants {
        static let buttonCornerRadius = CGFloat(20)
        static let actionSheetCornerRedius = CGFloat(25)
        static let staticAdditionalHieghtForActionSheet = CGFloat(360)
        static let buttonCornerFontSize = CGFloat(17)
    }
}

// MARK: - Strings
//
private extension CalendarViewController {
    enum Strings {
        static let submmitButtonTitle = "موافق"
        static let arabicIdentifer = "ar_AE"
    }
}
