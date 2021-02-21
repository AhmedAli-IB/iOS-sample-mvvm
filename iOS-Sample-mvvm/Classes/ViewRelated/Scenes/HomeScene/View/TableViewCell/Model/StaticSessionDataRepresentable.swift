//
//  StaticSessionDataRepresentable.swift
//  iOS-Sample-mvvm
//
//  Created by Aya Essam on 21/02/2021.
//

import UIKit

protocol StaticSessionDataRepresentable: ImageRepresentable {
    var sessionTitle: String { get }
    var sessionDescription: String { get }
//    var sessionIcon: String { get }
    var sessionColor: UIColor { get }
}
