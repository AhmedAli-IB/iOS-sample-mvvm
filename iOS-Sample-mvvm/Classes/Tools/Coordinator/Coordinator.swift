//
//  Coordinator.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 21/01/2021.
//

import UIKit

/// when you need to push view controller in same coordinator we will use show method
/// when  you need to present view controlle  in same coordinator we will use present method
/// when you need to run new cooridinator flow user run method
/// A basic coordinator design pattern to help decouple things.
//
protocol Coordinator {
    
    /// Root navigation controller of the coordinator.
    ///
    var navigationController: UINavigationController { get }
    
    /// Starts job of the coordinator.
    ///
    func start()
}
