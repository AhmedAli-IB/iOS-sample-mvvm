//
//  CentersViewModel.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 01/02/2021.
//

import Foundation

// MARK: - CentersViewModel
//
class CentersViewModel: BaseViewModel {
    
    // MARK: - Properties
    //
    private var centers: [CenterModel] = [] {
        didSet {
            dataSource.setCenters(centers)
        }
    }
    
    private let serviceLocator: CentersServiceLocatorProtocol
    
    /// SearchPeopleDataSource
    ///
    var dataSource: CentersDataSource = {
        return CentersDataSource()
    }()
    
    // MARK: - CallBacks
    
    /// Called when data is updated and reload is needed.
    ///
    private var onReloadNeededSubject = PublishSubject<Void>()
    
    // MARK: - Init
    //
    init(serviceLocator: CentersServiceLocatorProtocol = CentersServiceLocator()) {
        self.serviceLocator = serviceLocator
    }
    
    var numberOfItms: Int {
        return centers.count
    }
    
    // MARK: - Handlers
    //
    func viewDidLoad() {
        getCenters()
    }
    
    /// Get Filtration Item for specific
    ///
    func getCenterItem(indexPath: IndexPath) -> CenterModel {
        return centers[indexPath.row]
    }
}

// MARK: - handlers
//
extension CentersViewModel {
    
    /// Get centers from service locator
    ///
    func getCenters() {
        state.send(.loading)

        serviceLocator.getCenters { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let centers):
                self.centers = centers
                self.state.send(.success)
                self.onReloadNeededSubject.send(())
            case .failure(let error):
                self.state.send(.failure(error.localizedDescription))
            }
        }
    }
}
// MARK: - Helpers
//
extension CentersViewModel {
    
    /// Provide access to `onReloadNeededSubject`
    ///
    var onReloadNeeded: Observable<Void> {
        return onReloadNeededSubject
    }
}
