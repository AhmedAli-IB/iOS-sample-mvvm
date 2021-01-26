//
//  SearchPepoleViewModel.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 24/01/2021.
//

import Foundation

// MARK: - Search Pepole ViewModel
//
class SearchPepoleViewModel: BaseViewModel {
  
    // MARK: - Properties
    //
    private var filtrationItems: [FiltrationModel] = []
    private let serviceLocator: SearchServiceLocatorProtocol

    /// SearchPeopleDataSource
    ///
    var dataSource: SearchPeopleDataSource = {
        return SearchPeopleDataSource()
    }()
    
    // MARK: - Init
    init(serviceLocator: SearchServiceLocatorProtocol) {
        self.serviceLocator = serviceLocator
    }
    
    var numberOfItms: Int {
        return filtrationItems.count
    }
    
    // MARK: - Handlers
    //
    func viewDidLoad() {
        filtrationItems = FiltrationModel.createFiltrationModels()
        serviceLocator.getContributors { result in
            switch result {
            
            case .success(_):
                print("success")
            case .failure(_):
                print("failure")
            }
        }
    }
    
    /// Get Filtration Item for specific
    ///
    func getFiltrationItem(indexPath: IndexPath) -> FiltrationModel {
        return filtrationItems[indexPath.row]
    }
}
