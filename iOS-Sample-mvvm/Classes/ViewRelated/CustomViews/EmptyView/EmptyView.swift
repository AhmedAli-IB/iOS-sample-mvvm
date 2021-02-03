//
//  EmptyView.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 03/02/2021.
//

import UIKit

class EmptyView: UIView {
    
    @IBOutlet private weak var imageContainerView: UIView!
    @IBOutlet private weak var emptyImageView: UIImageView!
    @IBOutlet private weak var messageEmptyLabel: UILabel!
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    func configureView(with image: UIImage?, and message: String?) {
        messageEmptyLabel.text = message
        image == nil ? (imageContainerView.isHidden = true) : (emptyImageView.image = image)
    }
}

// MARK: - Configuration
//
private extension EmptyView {
    /// Configure view
    ///
    func configureView() {
        
    }
}
