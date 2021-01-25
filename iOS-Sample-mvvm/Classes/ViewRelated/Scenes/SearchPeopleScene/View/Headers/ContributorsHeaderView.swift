//
//  ContributorsHeaderView.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 25/01/2021.
//

import UIKit

class ContributorsHeaderView: UITableViewHeaderFooterView {

    @IBOutlet private weak var headerTitleLabel: UILabel!
    
    /// Configure view
    ///
    func cinfigureView(title: String) {
        headerTitleLabel.text = title
    }
}
