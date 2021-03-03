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
    
    weak var coordinator: HomeCoordinatorProtocol?
    
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

// MARK: - IBActions
//
private extension SearchPepoleViewController {
    @IBAction func backButtonTapped(_ sender: UIButton) {
        coordinator?.popViewController()
    }
}

// MARK: - Configure View
//
private extension SearchPepoleViewController {
    
    /// Configure view
    ///
    func configureView() {
        searchBar.searchTextField.placeholder = Strings.searchBarBlaceholder
//        self.navigationItem.setHidesBackButton(true, animated: true)

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
                viewModel.selectItem(at: indexPath)
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
            case .calendar:
                let selectedDates = viewModel.getSelectedDates()
                let calendarViewModel = CalendarViewModel(selectedDates: selectedDates)
                let calendarViewController =  CalendarViewController(viewModel: calendarViewModel)
                calendarViewController.delegate = self
                actionSheetController = calendarViewController
            }
        
            guard let controller =  actionSheetController else { return }
            coordinator?.showActionSheet(self.view, controller)    
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
        static let searchBarBlaceholder = "Search".localized
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

// MARK: - CalendarProtocol
/// Set  filtered dates
//
extension SearchPepoleViewController: CalendarProtocol {
    func filteredDates(dates: [Date]) {
        viewModel.setFiltredDates(dates: dates)
    }
}
