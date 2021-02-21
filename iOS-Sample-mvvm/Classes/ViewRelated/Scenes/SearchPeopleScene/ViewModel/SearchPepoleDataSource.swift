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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].rows.isEmpty ? setupEmptyView(tableView) : tableView.restore()
        return sections[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = sections[indexPath.section].rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: row.reuseIdentifier, for: indexPath)
        configureCell(cell, at: indexPath)
        
        return cell
    }
}

// MARK: - Helpers
//
extension SearchPeopleDataSource {
    
    func setupEmptyView(_ tableView: UITableView) {
        tableView.setEmptyView(image: Asset.Assets.icNoSearchResult.image, message: Strings.noSearchResult)
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
        cell.viewModel = contributors[indexPath.row]
    }
}

// MARK: - Reload Sections
//
extension SearchPeopleDataSource {
    
    func reloadSections() {
        self.sections = {
            
            let contributorsSection: Section = {
                
//                guard self.contributors.isEmpty == false else { return nil }
                
                var rows: [RowType] = []
                
                contributors.forEach {_ in
                    rows.append(RowType.searchPeople)
                }
                
                return Section(title: Strings.suggestions, rows: rows)
            }()
            return [contributorsSection].compactMap { $0 }
        }()
    }
    
}

// MARK: - UITableViewDelegate
//
extension SearchPeopleDataSource {
    
    func viewForHeaderInSection(_ section: Int, in tableView: UITableView) -> UIView? {
    
        guard let header = tableView.dequeueReusableHeaderFooterView(
                withIdentifier: ContributorsHeaderView.classNameWithoutNamespaces)
                as? ContributorsHeaderView else {
            fatalError("Unable to get header view")
        }
        header.configure(title: sections[section].title ?? "")
        return header
    }
    
    func heightForHeaderInTableView(_ tableView: UITableView, section: Int) -> CGFloat {
        Constants.headerHeight
    }
    
    func heightForRowInTableView(_ tableView: UITableView, section: Int) -> CGFloat {
        Constants.rowHeight

    }
}

// MARK: - Constants
//
private extension SearchPeopleDataSource {
    
    // MARK: - Constants
    //
    enum Constants {
        static let headerHeight = CGFloat(48)
        static let rowHeight = CGFloat(132)
        static let headerFountSize = CGFloat(18)
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
        static let noSearchResult: String = "لا يوجد نتائج"

    }
}
