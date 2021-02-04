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
    private var centers: [CenterModel] = []
    
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
    init(serviceLocator: CentersServiceLocatorProtocol = CentersServiceLocator(), selectedCenters: [CenterModel]) {
        self.serviceLocator = serviceLocator
        self.centers = selectedCenters
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
    /// User tab on item mark it selected or no selected
    ///
    func selectCenter(indexPath: IndexPath) {
        centers[indexPath.row].isSelected =  !centers[indexPath.row].isSelected
        dataSource.setCenters(centers)
        self.onReloadNeededSubject.send(())
    }
    
    func getSelectedCenters() -> [CenterModel] {
        centers.filter { ($0.isSelected) }
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

                centers.forEach({
                    if self.centers.contains(obj: $0) == false {
                        self.centers.append($0)
                    }
                })
                self.dataSource.setCenters(self.centers)
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
