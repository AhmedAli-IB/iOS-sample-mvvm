//
//  Array+Contains.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 02/02/2021.
//

import Foundation

extension Array {
    func contains<T>(obj: T) -> Bool where T: Equatable {
        return self.filter({ $0 as? T == obj }).count > .zero
    }
}
