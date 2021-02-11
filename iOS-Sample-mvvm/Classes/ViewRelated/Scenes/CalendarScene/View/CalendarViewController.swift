//
//  CalendarViewController.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 04/02/2021.
//

import UIKit
import FSCalendar

/// `CalendarProtocol` responsable for send selected filters of dates as timestamp
///
protocol CalendarProtocol: class {
    func filteredDates(dates: [Date])
}

// MARK: - CalendarViewController
/// App Installation Problem with carthage  #1275
/// https://github.com/WenchaoD/FSCalendar/issues/1275
///
class CalendarViewController: BaseViewController {
    
    // MARK: - IBOutlets
    //
    @IBOutlet private weak var submitButton: UIButton!
    @IBOutlet private weak var calendar: FSCalendar!
    
    // MARK: - Properties
    //
    private let viewModel: CalendarViewModel!

//    private var filteredDates: [Date] = [Date(timeIntervalSinceReferenceDate: 636069600.0),
//                                         Date(timeIntervalSinceReferenceDate: 635896800.0)]
    private var shouldReload: (() -> Void)?
    weak var delegate: CalendarProtocol?

    // MARK: - LifeCycle
    //
    required init(viewModel: CalendarViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        delegate?.filteredDates(dates: viewModel.getSelectedDates())
    }
}

// MARK: - Configuration
//
private extension CalendarViewController {
    
    func configureCalendar() {
        // swiftlint:disable explicit_init
        calendar.locale = Locale.init(identifier: Strings.arabicIdentifer)
//        calendar.select(Date(timeIntervalSinceReferenceDate: 633996000.0))
        calendar.allowsMultipleSelection = true

        viewModel.getSelectedDates().forEach { (date) in
            self.calendar.select(date)
        }
        calendar.delegate = self
        calendar.dataSource = self
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

// MARK: - FSCalendarDelegate
//
extension CalendarViewController: FSCalendarDelegate, FSCalendarDelegateAppearance, FSCalendarDataSource {
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-YYYY at h:mm a"
        let string = formatter.string(from: date)
        print(string)
        viewModel.setSelectedDate(date: date)
        print(date.timeIntervalSince1970)
//        filteredDates.append(date.timeIntervalSince1970)
    }
    
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
//        filteredDates.removeAll { $0 == date.timeIntervalSince1970 }
        viewModel.setSelectedDate(date: date)

    }
}
