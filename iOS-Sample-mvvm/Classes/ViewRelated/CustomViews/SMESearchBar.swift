//
//  SMESearchBar.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 24/01/2021.
//

import UIKit

// MARK: - SMESearchBar - Customized SME UISearchBar
//
class SMESearchBar: UISearchBar {
    
    // MARK: - Init
    //
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
        
    // MARK: - Handlers
    
    /// Apply search configuration, override this method to add custom implementation.
    ///
    func configureView() {
        searchTextField.layer.cornerRadius = Constants.textFieldCornerRadius
        searchTextField.layer.masksToBounds = true
        searchTextField.backgroundColor = .white
        backgroundImage = UIImage()
    }
}

private extension SMESearchBar {
    
    enum Constants {
        static let textFieldCornerRadius = CGFloat(16)
    }
}
