//
//  SearchPepoleViewController.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 24/01/2021.
//

import UIKit

class SearchPepoleViewController: UIViewController {

    // MARK: - IBOutlets
    //
    @IBOutlet weak private var searchBar: SMESearchBar!
    
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
    }
}
// MARK: - Strings
//
private extension SearchPepoleViewController {
    enum Strings {
       static let searchBarBlaceholder = "البحث"
    }
}
