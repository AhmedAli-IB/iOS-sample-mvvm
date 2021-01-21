//
//  AppTab.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 21/01/2021.
//

import Foundation

/// Enum representing the individual tabs
///
enum AppTab {
    
    /// Home Tab
    ///
    case home
    
    /// Chat Tab
    ///
    case chat
    
    /// Notification Tab
    ///
    case notification

    
    /// Account Tab
    ///
    case account
}

extension AppTab {
    /// Initializes a tab with the visible tab index.
    ///
    /// - Parameters:
    ///   - visibleIndex: the index of visible tabs on the tab bar
    init(visibleIndex: Int) {
        let tabs = AppTab.visibleTabs()
        self = tabs[visibleIndex]
    }
    
    /// Returns the visible tab index.
    func visibleIndex() -> Int {
        let tabs = AppTab.visibleTabs()
        guard let tabIndex = tabs.firstIndex(where: { $0 == self }) else {
            assertionFailure("Trying to get the visible tab index for tab \(self) while the visible tabs are: \(tabs)")
            return .zero
        }
        return tabIndex
    }
    
    static func visibleTabs() -> [AppTab] {
        return [.home, .chat, .notification, .account]
    }
}
