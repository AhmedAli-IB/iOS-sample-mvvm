//
//  SearchPepoleDataSource.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 25/01/2021.
//

import UIKit

// MARK: - Search pepole table view data source
//
class SearchPeopleDataSource: NSObject {
    
    // MARK: - Properties
    //
    private var sections: [Section] = []
    private var contributors: [Contributor] = []
}

// MARK: - Configure View Data
//
extension SearchPeopleDataSource {
    
    func setContributors(_ contributors: [Contributor]) {
        self.contributors = contributors
    }
}

// MARK: - UITableViewDataSource
//
extension SearchPeopleDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let row = sections[indexPath.section].rows[indexPath.row]
        //        let cell = tableView.dequeueReusableCell(withIdentifier: row.reuseIdentifier, for: indexPath)
        //        configureCell(cell, at: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: ContributorTableViewCell.reuseIdentifier,
                                                 for: indexPath) as? ContributorTableViewCell
        
        return cell ?? UITableViewCell()
    }
}

// MARK: - UITableViewDataSource conformance helpers
//
extension SearchPeopleDataSource {
    
    func configureCell(_ cell: UITableViewCell, at indexPath: IndexPath) {
        switch cell {
        case let cell as ContributorTableViewCell:
            configureContributorCell(cell, at: indexPath)
        default:
            fatalError("Unexpected cell sent to \(#function)")
        }
    }
    
    /// Configure contributor cell
    ///
    func configureContributorCell(_ cell: ContributorTableViewCell, at indexPath: IndexPath) {
    }
}

// MARK: - UITableViewDelegate
extension SearchPeopleDataSource {
    
    func viewForHeaderInSection(_ section: Int, in tableView: UITableView) -> UIView? {
        
//        let header = UILabel()
//        header.text =
//        header.textColor = Asset.ColorPalette.primaryColor.color
//
//        return header
        guard let header = tableView.dequeueReusableHeaderFooterView(
                withIdentifier: ContributorsHeaderView.classNameWithoutNamespaces)
                as? ContributorsHeaderView else {
            fatalError("Unable to get header view")
        }
        header.cinfigureView(title: "اقتراحات")
//        header.headerTitleLabel.font = .boldSystemFont(ofSize: Constants.headerFontSize)
        return header
    }
    
    func heightForHeaderInTableView(_ tableView: UITableView, section: Int) -> CGFloat {
        return Constants.headerHeight
    }
}

// MARK: - Constants
//
private extension SearchPeopleDataSource {
    
    // MARK: - Constants
    //
    enum Constants {
        static let headerHeight = CGFloat(48)
    }
    
    // MARK: - Section
    //
    struct Section {
        let title: String?
        let rows: [RowType]
    }
    
    // MARK: - Row
    //
    enum RowType {
        case searchPeople
        
        var reuseIdentifier: String {
            switch self {
            case .searchPeople:
                return ContributorTableViewCell.reuseIdentifier
            }
        }
    }
}

// MARK: - Strings
//
private extension SearchPeopleDataSource {
    
    enum Strings {
        static var suggestions: String = "اقتراحات"
    }
}
