//
//  UITableView+Helpers.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 03/02/2021.
//

import UIKit

extension UITableView {
    
    /// Add empty view to table view
    ///
    func setEmptyView(image: UIImage, message: String) {
        
        let emptyView: EmptyView = EmptyView.fromNib()
        emptyView.configureView(with: image, and: message)
        emptyView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(emptyView)
        
        emptyView.widthAnchor.constraint(equalToConstant: 180).isActive = true
        emptyView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        emptyView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        emptyView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        // The only tricky part is here:
        self.backgroundView = emptyView
        self.separatorStyle = .none
    }
    
    /// Remove empty view
    ///
    func restore() {
        self.backgroundView = nil
    }
}
