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
    private var contributors: [Contributor] = []
    
    private let serviceLocator: SearchServiceLocatorProtocol
    
    /// SearchPeopleDataSource
    ///
    var dataSource: SearchPeopleDataSource = {
        return SearchPeopleDataSource()
    }()
    
    var filterOnlineContributors: Bool = false
    
    // MARK: - CallBacks
    
    /// Called when data is updated and reload is needed.
    ///
    private var onReloadNeededSubject = PublishSubject<Void>()
    
    // MARK: - Init
    //
    init(serviceLocator: SearchServiceLocatorProtocol = SearchServiceLocator()) {
        self.serviceLocator = serviceLocator
    }
    
    var numberOfItms: Int {
        return filtrationItems.count
    }
    
    // MARK: - Handlers
    //
    func viewDidLoad() {
        filtrationItems = FiltrationModel.createFiltrationModels()
        getContributors(request: ContributorRequest())
    }
    
    /// Get Filtration Item for specific
    ///
    func getFiltrationItem(indexPath: IndexPath) -> FiltrationModel {
        return filtrationItems[indexPath.row]
    }
}

// MARK: - handlers
//
extension SearchPepoleViewModel {
    
    /// Get contributors from service locator
    ///
    func getContributors(request: ContributorRequest) {
        state.send(.loading)
        serviceLocator.getContributors(contributorRequest: request) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let contributors):
                self.contributors = contributors
                
                if self.filterOnlineContributors {
                    self.filterOnline()
                } else {
                    self.dataSource.setContributors(contributors)
                }
                self.state.send(.success)
                self.onReloadNeededSubject.send(())
            case .failure(let error):
                self.state.send(.failure(error.localizedDescription))
            }
        }
    }
    
    /// Show only online contibutors
    ///
    func filterOnline(isOnline: Bool = true) {
        if isOnline {
            let onlineContributors =  contributors.filter({ $0.online })
            dataSource.setContributors(onlineContributors)
        } else {
            dataSource.setContributors(contributors)
        }
            self.onReloadNeededSubject.send(())
    }
}
// MARK: - Helpers
//
extension SearchPepoleViewModel {
    
    /// Provide access to `onReloadNeededSubject`
    ///
    var onReloadNeeded: Observable<Void> {
        return onReloadNeededSubject
    }
}
