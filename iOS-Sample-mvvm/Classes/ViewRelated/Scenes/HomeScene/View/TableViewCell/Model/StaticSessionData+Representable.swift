//
//  StaticSessionData+Representable.swift
//  iOS-Sample-mvvm
//
//  Created by Aya Essam on 21/02/2021.
//

import UIKit

extension StaticSessionData: StaticSessionDataRepresentable {
    
    var imageURL: String? {
        icon
    }
    
    var placeholderImage: UIImage? {
        UIImage(named: icon)
    }

    var sessionTitle: String {
        title
    }
    
    var sessionDescription: String {
        description
    }

    var sessionColor: UIColor {
        UIColor(named: color ) ?? Asset.ColorPalette.blue0.color
    }
    
}
