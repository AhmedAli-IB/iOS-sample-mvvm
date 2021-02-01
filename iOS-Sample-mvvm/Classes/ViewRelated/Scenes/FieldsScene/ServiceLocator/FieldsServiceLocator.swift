//
//  FieldsServiceLocator.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 01/02/2021.
//

import Foundation

// MARK: - FieldsServiceLocatorProtocol
//
protocol FieldsServiceLocatorProtocol {
    func getSubjects(onCompletion: @escaping (Result<[SubjectModel], Error>) -> Void)
}
// MARK: - FieldsServiceLocator
//
class FieldsServiceLocator: FieldsServiceLocatorProtocol {
    
    // MARK: - Properties
    //
    let network = NetworkManager()
    // MARK: - Handlers
    //
    func getSubjects(onCompletion: @escaping (Result<[SubjectModel], Error>) -> Void) {
        network.request(.getSubjects) { (result: Result<SubjectsMainResponse, Error>) in
            switch result {
            
            case .success(let response):
                guard let subjectResponse = response.data  else {
                    return
                }
                /// Verify th e transformation of response  to `SubjectModel` object
                ///
                var subjects: [SubjectModel]  = []
                subjectResponse.forEach {
                    guard let `subject` = SubjectModel(field: $0) else { return }
                    subjects.append(`subject`)
                }
                onCompletion(.success(subjects))
            case .failure(let error):
                onCompletion(.failure(error))
            }
        }
    }
}
