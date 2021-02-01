//
//  CentersDataSource.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 01/02/2021.
//

import UIKit
// MARK: - Search pepole table view data source
//
class CentersDataSource: NSObject {
    
    // MARK: - Properties
    //
    private var sections: [Section] = []
    private var centers: [CenterModel] = []
}

// MARK: - Configure View Data
//
extension CentersDataSource {
    
    func setCenters(_ centers: [CenterModel]) {
        self.centers = centers
    }
}

// MARK: - UITableViewDataSource
//
extension CentersDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = sections[indexPath.section].rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: row.reuseIdentifier, for: indexPath)
        configureCell(cell, at: indexPath)
        
        return cell
    }
}

// MARK: - UITableViewDataSource conformance helpers
//
extension CentersDataSource {
    
    func configureCell(_ cell: UITableViewCell, at indexPath: IndexPath) {
        switch cell {
        case let cell as CenterTableViewCell:
            configureCenterCell(cell, at: indexPath)
        default:
            fatalError("Unexpected cell sent to \(#function)")
        }
    }
    
    /// Configure contributor cell
    ///
    func configureCenterCell(_ cell: CenterTableViewCell, at indexPath: IndexPath) {
        cell.viewModel = centers[indexPath.row]
    }
}

// MARK: - Reload Sections
//
extension CentersDataSource {
    
    func reloadSections() {
        self.sections = {
            
            let  centersSection: Section? = {
                
                guard self.centers.isEmpty == false else { return nil }
                
                var rows: [RowType] = []
                
                centers.forEach {_ in
                    rows.append(RowType.centerRow)
                }
                
                return Section(title: Strings.selectBlace, rows: rows)
            }()
            return [centersSection].compactMap { $0 }
        }()
    }
    
}

// MARK: - UITableViewDelegate
//
extension CentersDataSource {
    
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
    
//    func heightForRowInTableView(_ tableView: UITableView, section: Int) -> CGFloat {
//        Constants.rowHeight
//
//    }
}

// MARK: - Constants
//
private extension CentersDataSource {
    
    // MARK: - Constants
    //
    enum Constants {
        static let headerHeight = CGFloat(48)
        static let rowHeight = CGFloat(132)
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
        case centerRow
        
        var reuseIdentifier: String {
            switch self {
            case .centerRow:
                return CenterTableViewCell.reuseIdentifier
            }
        }
    }
}

// MARK: - Strings
//
private extension CentersDataSource {
    
    enum Strings {
        static var selectBlace: String = "اختار المركز"
    }
}
