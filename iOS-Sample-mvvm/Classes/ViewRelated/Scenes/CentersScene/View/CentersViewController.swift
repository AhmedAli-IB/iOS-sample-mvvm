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
    @IBOutlet private weak var submitButton: UIButton!
    
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

// MARK: - IBActions
extension CentersViewController {
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        print(viewModel.getSelectedCenters())
    }
}
// MARK: - Configure View
//
private extension CentersViewController {
    
    /// Configure view
    ///
    func configureView() {
        submitButton.layer.cornerRadius = Constants.buttonCornerRadius
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectCenter(indexPath: indexPath)
    }
}

// MARK: - Constants
//
private extension CentersViewController {
    enum Constants {
        static let buttonCornerRadius = CGFloat(12)
    }
}
