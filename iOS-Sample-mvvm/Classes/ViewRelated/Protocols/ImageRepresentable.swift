//
//  ImageRepresentable.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 18/01/2021.
//

import UIKit

// MARK: - ImageRepresentable
//
protocol ImageRepresentable {
    var imageURL: String? { get }
    var placeholderImage: UIImage? { get }
}
