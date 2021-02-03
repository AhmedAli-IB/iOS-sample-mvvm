//
//  SearchPepoleViewController.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 24/01/2021.
//

import UIKit

class SearchPepoleViewController: BaseViewController {
    
    // MARK: - IBOutlets
    //
    @IBOutlet weak private var searchBar: SMESearchBar!
    @IBOutlet weak private var collectionView: UICollectionView!
    
    @IBOutlet weak private var tableView: UITableView!
    
    // MARK: - Properties
    //
    private let viewModel: SearchPepoleViewModel = SearchPepoleViewModel()
//    private var isOnline: Bool = false
    
    // MARK: - Life cycle
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}

// MARK: - Configure View
//
private extension SearchPepoleViewController {
    
    /// Configure view
    ///
    func configureView() {
        searchBar.searchTextField.placeholder = Strings.searchBarBlaceholder
        endEditting()
        configureViewModel()
        registerCells()
        registerHeader()
        setupSearchBar()
        setupCollectionView()
        setupTableView()
    }
    
    func registerCells() {
        let cellNib = UINib(nibName: FiltrationCollectionViewCell.classNameWithoutNamespaces, bundle: nil)
        collectionView.register(cellNib,
                                forCellWithReuseIdentifier: FiltrationCollectionViewCell.reuseIdentifier)
        let contributorCellNib = UINib(nibName: ContributorTableViewCell.classNameWithoutNamespaces, bundle: nil)
        tableView.register(contributorCellNib, forCellReuseIdentifier: ContributorTableViewCell.reuseIdentifier)
    }
    /// Register headers
    ///
    func registerHeader() {
        tableView.register(ContributorsHeaderView.loadNib(),
                           forHeaderFooterViewReuseIdentifier: ContributorsHeaderView.classNameWithoutNamespaces)
    }
    
    func setupSearchBar() {
        searchBar.delegate = self
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.allowsMultipleSelection = true
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
        collectionView.reloadData()
    }
}
// MARK: - Handlers
//
private extension SearchPepoleViewController {
    
//    /// Filter contributors
//    ///
//    func filterContributors(with online: Bool, searchText: String) {
//        let request = ContributorRequest(searchText: searchText)
//        viewModel.filterOnlineContributors = online
//        viewModel.getContributors(request: request)
//    }
    
    /// Show action sheet bottom card
    ///
    func showActionSheet(_ viewController: UIViewController & ActionSheetPresentable) {
        
        let cardVC = CardViewController(viewController: viewController)
        
        // set the modal presentation to full screen, in iOS 13, its no longer full screen by default
        cardVC.modalPresentationStyle = .fullScreen
        
        // take a snapshot of current view and set it as backingImage
        cardVC.backingImage = self.view.asImage()
        
        // present the view controller modally without animation
        self.present(cardVC, animated: false, completion: nil)
    }
    
}
// MARK: - Helpers
//
private extension SearchPepoleViewController {
    
    /// calculate item wifth based on title text
    /// - Returns: cell width
    func calculateItemWidth(item: FiltrationModel) -> CGFloat {
        var staticWidth: CGFloat = .zero
        item.expanded == true ? (staticWidth = Constants.expandedItemWidth) : (staticWidth = Constants.normalItemWidth)
        let itemFont =  FontFamily._29LTAzer.medium.font(size: Constants.itemFontSize)
        let  itemTextWidth = item.filterTitle.size(withAttributes: [.font: itemFont])
        return CGFloat(itemTextWidth.width + staticWidth)
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
//
extension SearchPepoleViewController: UICollectionViewDelegate,
                                      UICollectionViewDataSource,
                                      UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItms
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reuseIdentifier  = FiltrationCollectionViewCell.reuseIdentifier
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
            as? FiltrationCollectionViewCell
        cell?.viewModel = viewModel.getFiltrationItem(indexPath: indexPath)
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemWidth = calculateItemWidth(item: viewModel.getFiltrationItem(indexPath: indexPath))
        
        return CGSize(width: itemWidth, height: Constants.collectionItemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let item = viewModel.getFiltrationItem(indexPath: indexPath)
        
        var actionSheetController: (UIViewController & ActionSheetPresentable)?
        
            switch item.filtrationType {
            case .online:
                viewModel.selectOnlineFiltration(at: indexPath)
            case .fields:
                
                let selectedFields = viewModel.getSelectedSubjects()
                let fieldsViewController = FieldsViewController(viewModel: FieldsViewModel(
                                                                    selectedFields: selectedFields))
                fieldsViewController.delegate = self
                actionSheetController = fieldsViewController
                
            case .location:
                let selectedCenters = viewModel.getSelectedCenters()
                let centersViewController = CentersViewController(viewModel: CentersViewModel(
                                                                    selectedCenters: selectedCenters))
                centersViewController.centerDelegate = self
                actionSheetController = centersViewController
            }
        
            guard let controller =  actionSheetController else { return }
            showActionSheet(controller)
    
    }

}

// MARK: - UITableViewDelegate
//
extension SearchPepoleViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        viewModel.dataSource.viewForHeaderInSection(section, in: tableView)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        viewModel.dataSource.heightForHeaderInTableView(tableView, section: section)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        viewModel.dataSource.heightForRowInTableView(tableView, section: indexPath.section)
        
    }
}

// MARK: - Strings
//
private extension SearchPepoleViewController {
    enum Strings {
        static let searchBarBlaceholder = "البحث"
    }
}

// MARK: - Constants
//
private extension SearchPepoleViewController {
    enum Constants {
        static let expandedItemWidth = CGFloat(74)
        static let normalItemWidth = CGFloat(52)
        static let collectionItemHeight = CGFloat(40)
        static let itemFontSize = CGFloat(14)

    }
}

// MARK: - UISearchBarDelegate
//
extension SearchPepoleViewController: UISearchBarDelegate {
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        guard let text = searchBar.searchTextField.text else { return }
        viewModel.search(with: text)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.searchTextField.text else { return }
        viewModel.search(with: text)
    }
}
// MARK: - CentersProtocol
/// Set  filtered centers
//
extension SearchPepoleViewController: CentersProtocol {
    func filteredCenters(centers: [CenterModel]) {
        viewModel.setfiltredCenter(centers: centers)
    }
}

// MARK: - CentersProtocol
/// Set  filtered centers
//
extension SearchPepoleViewController: FieldsProtocol {
    
    func filteredFields(fields: [SubjectModel]) {
        viewModel.setfiltredSubject(subjects: fields)
    }
}
