//
//  FieldsViewModel.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 01/02/2021.
//

import Foundation

// MARK: - FieldsViewModel
//
class FieldsViewModel: BaseViewModel {
    
    // MARK: - Properties
    //
    private var subjects: [SubjectModel] = []
    /// This subjects aleardy selected by the user.
    ///
    private var selectedSubjects: [SubjectModel] = []
    
    private let serviceLocator: FieldsServiceLocatorProtocol
    
    // MARK: - CallBacks
    
    /// Called when data is updated and reload is needed.
    ///
    private var onReloadNeededSubject = PublishSubject<Void>()
    
    // MARK: - Init
    //
    init(serviceLocator: FieldsServiceLocatorProtocol = FieldsServiceLocator(), selectedFields: [SubjectModel]) {
        self.serviceLocator = serviceLocator
        self.selectedSubjects = selectedFields
    }
    
    var numberOfItms: Int {
        return subjects.count
    }
    
    // MARK: - Handlers
    //
    func viewDidLoad() {
        getSubjects()
    }
    
    /// Get Subject Item for specific row
    ///
    func getSubjectItem(indexPath: IndexPath) -> SubjectModel {
        return subjects[indexPath.row]
    }
    
    /// Change select state of item
    ///
    func selectItem(at index: IndexPath) {
        subjects[index.item].isSelected = !subjects[index.item].isSelected
        self.onReloadNeededSubject.send(())
    }
    
    /// Get all selected subjects by user
    ///
    func getSelectedSubjects() -> [SubjectModel] {
        subjects.filter({ $0.isSelected })
    }
}

// MARK: - handlers
//
private extension FieldsViewModel {
    
    /// Get subjects from service locator
    ///
    func getSubjects() {
        state.send(.loading)
        
        serviceLocator.getSubjects { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            
            case .success(let subjects):
                
                self.subjects.append(contentsOf: self.selectedSubjects)
                subjects.forEach({
                    if self.selectedSubjects.contains(obj: $0) == false {
                        self.subjects.append($0)
                    }
                })
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
extension FieldsViewModel {
    
    /// Provide access to `onReloadNeededSubject`
    ///
    var onReloadNeeded: Observable<Void> {
        return onReloadNeededSubject
    }
}
