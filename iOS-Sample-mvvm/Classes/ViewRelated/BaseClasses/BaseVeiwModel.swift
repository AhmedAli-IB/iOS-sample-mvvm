//
//  BaseVeiwModel.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 24/01/2021.
//

import Foundation

// MARK: - Base View Model
//
class BaseViewModel {

    typealias Element = Any

    /// State
    var state = PublishSubject<State<Element>>()

}
