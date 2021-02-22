//
//  FieldsViewController.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 01/02/2021.
//

import UIKit

/// `FieldsProtocol` responsable for send selected filters
///
protocol FieldsProtocol: class {
    func filteredFields(fields: [SubjectModel])
}
// MARK: - FieldsViewController
/// `FieldsViewController`  responsible for filter contributors with fields
//
class FieldsViewController: BaseViewController {
    
    // MARK: - IBOutlets
    //
    @IBOutlet private weak var collectionView: UICollectionView!
    
    @IBOutlet private weak var submitButton: UIButton!
    // MARK: - Properties
    //
    let viewModel: FieldsViewModel!
    var shouldReload: (() -> Void)?
    weak var delegate: FieldsProtocol?
    
    // MARK: - LifeCycle
    //
    required init(viewModel: FieldsViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        registerCells()
        setupCollectionView()
        configureViewModel()
    }
    
    deinit {
        print("FieldsViewController --- deinit")
    }
}

extension FieldsViewController {
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        delegate?.filteredFields(fields: viewModel.getSelectedSubjects())
        self.dismiss(animated: true)
    }
}
// MARK: - Configure View
//
private extension FieldsViewController {
   
    func configureView() {
        submitButton.layer.cornerRadius = Constants.buttonCornerRadius
        submitButton.titleLabel?.text = Strings.submmitButtonTitle
    }
    
    func registerCells() {
        let cellNib = UINib(nibName: FieldsCollectionViewCell.classNameWithoutNamespaces, bundle: nil)
        collectionView.register(cellNib,
                                forCellWithReuseIdentifier: FieldsCollectionViewCell.reuseIdentifier)
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.allowsMultipleSelection = true
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
        collectionView.reloadData()
        shouldReload?()
    }
}

// MARK: - UICollectionViewDelegate && UICollectionViewDataSource
//
extension FieldsViewController: UICollectionViewDelegate,
                                UICollectionViewDataSource,
                                UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItms
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reuseIdentifier  = FieldsCollectionViewCell.reuseIdentifier
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
            as? FieldsCollectionViewCell
        cell?.viewModel = viewModel.getSubjectItem(indexPath: indexPath)
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.selectItem(at: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item =  viewModel.getSubjectItem(indexPath: indexPath)
        return CGSize(width: calculateItemWidth(item: item), height: Constants.collectionItemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}
// MARK: - Helpers
//
private extension FieldsViewController {
    
    /// calculate item wifth based on title text
    /// - Returns: cell width
    func calculateItemWidth(item: SubjectModel) -> CGFloat {
        let itemFont =  UIFont.systemFont(ofSize: Constants.itemFontSize)
        let  itemTextWidth = item.subjectName.size(withAttributes: [.font: itemFont])
        return CGFloat(itemTextWidth.width + Constants.staticWidth)
    }
}

// MARK: - Constants
//
private extension FieldsViewController {
    enum Constants {
        static let staticWidth = CGFloat(32)
        static let collectionItemHeight = CGFloat(60)
        static let itemFontSize = CGFloat(17)
        static let buttonCornerRadius = CGFloat(20)
        static let buttonCornerFontSize = CGFloat(17)
        static let actionSheetCornerRedius = CGFloat(25)
        static let staticAdditionalHieghtForActionSheet = CGFloat(100)

    }
}
// MARK: - Strings
//
private extension FieldsViewController {
    enum Strings {
        static let  submmitButtonTitle = "Submit".localized
    }
}

// MARK: - Conform PanModalPresentable
//
extension FieldsViewController: ActionSheetPresentable {
    
    var shouldReloadContent: (() -> Void)? {
        get {
            shouldReload
        }
        set {
            shouldReload = newValue
        }
    }
    var contentFormHeight: CGFloat {

        guard let scrollView = collectionView else {
            return .zero
        }

        // called once during presentation and stored
        scrollView.layoutIfNeeded()
        return scrollView.contentSize.height + Constants.staticAdditionalHieghtForActionSheet
    }
    var panScrollable: UIScrollView? {
        return collectionView
    }
    
    var dragIndicatorBackgroundColor: UIColor {
        return .white
    }
    
     var allowsTapToDismiss: Bool {
        return true
    }
    
    var cornerRadius: CGFloat {
        return Constants.actionSheetCornerRedius
    }
}
