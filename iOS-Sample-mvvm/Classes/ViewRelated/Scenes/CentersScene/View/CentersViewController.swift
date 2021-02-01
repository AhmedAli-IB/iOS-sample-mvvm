//
//  CentersViewController.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 01/02/2021.
//

import UIKit

class CentersViewController: BaseViewController {

    // MARK: - IBOutlets
    //
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    //
    private let viewModel: CentersViewModel = CentersViewModel()

    // MARK: - Lifecycel
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

}
// MARK: - Configure View
//
private extension CentersViewController {
    
    /// Configure view
    ///
    func configureView() {
        configureViewModel()
        registerCells()
        registerHeader()
        setupTableView()
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
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        viewModel.dataSource.heightForRowInTableView(tableView, section: indexPath.section)
//        
//    }
}
