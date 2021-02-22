//
//  CentersViewController.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 01/02/2021.
//

import UIKit

/// `CentersProtocol` responsable for send selected filters
///
protocol CentersProtocol: class {
    func filteredCenters(centers: [CenterModel])
}
///
///
class CentersViewController: BaseViewController {
    
    // MARK: - IBOutlets
    //
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var submitButton: UIButton!
    
    // MARK: - Properties
    //
    private let viewModel: CentersViewModel!
    var shouldReload: (() -> Void)?
    weak var centerDelegate: CentersProtocol?
    
    // MARK: - LifeCycle
    //
    required init(viewModel: CentersViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycel
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    deinit {
        print("CentersViewController -- deinit")
    }
}

// MARK: - IBActions
extension CentersViewController {
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        centerDelegate?.filteredCenters(centers: viewModel.getSelectedCenters())
        self.dismiss(animated: true)
    }
}
// MARK: - Configure View
//
private extension CentersViewController {
        
    /// Configure view
    ///
    func configureView() {
        setupSubmitButton()
        registerCells()
        registerHeader()
        setupTableView()
        configureViewModel()

    }
    
    func registerCells() {
        let contributorCellNib = UINib(nibName: CenterTableViewCell.classNameWithoutNamespaces, bundle: nil)
        tableView.register(contributorCellNib, forCellReuseIdentifier: CenterTableViewCell.reuseIdentifier)
    }
    /// Register headers
    ///
    func registerHeader() {
        tableView.register(ContributorsHeaderView.loadNib(),
                           forHeaderFooterViewReuseIdentifier: ContributorsHeaderView.classNameWithoutNamespaces)
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = viewModel.dataSource
    }
    
    func configureViewModel() {
        bindLoadingState(to: viewModel)
        bindErrorState(to: viewModel)
        viewModel.onReloadNeeded.subscribe { [weak self] _ in
            self?.reloadSectionsAndData()
        }
        viewModel.viewDidLoad()
    }
    
    func reloadSectionsAndData() {
        viewModel.dataSource.reloadSections()
        tableView.reloadData()
        shouldReloadContent?()
    }
    
    func setupSubmitButton() {
       submitButton.layer.cornerRadius = Constants.buttonCornerRadius
       submitButton.titleLabel?.text = Strings.submmitButtonTitle
      submitButton.titleLabel?.font = FontFamily._29LTAzer.bold.font(size: Constants.buttonCornerFontSize)
   }
}

// MARK: - UITableViewDelegate
//
extension CentersViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        viewModel.dataSource.viewForHeaderInSection(section, in: tableView)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        viewModel.dataSource.heightForHeaderInTableView(tableView, section: section)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectCenter(indexPath: indexPath)
    }
}

// MARK: - Conform PanModalPresentable
//
extension CentersViewController: ActionSheetPresentable {
    
    var shouldReloadContent: (() -> Void)? {
        get {
            shouldReload
        }
        set {
            shouldReload = newValue
        }
    }
    var contentFormHeight: CGFloat {

        guard let scrollView = tableView else {
            return .zero
        }

        // called once during presentation and stored
        scrollView.layoutIfNeeded()
        return scrollView.contentSize.height + Constants.staticAdditionalHieghtForActionSheet
    }
    var panScrollable: UIScrollView? {
        return tableView
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
private extension CentersViewController {
    enum Constants {
        static let buttonCornerRadius = CGFloat(20)
        static let actionSheetCornerRedius = CGFloat(25)
        static let staticAdditionalHieghtForActionSheet = CGFloat(74)
        static let buttonCornerFontSize = CGFloat(17)
    }
}

// MARK: - Strings
//
private extension CentersViewController {
    enum Strings {
        static let submmitButtonTitle = "Submit".localized
    }
}
