//
//  SubjectModel.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 01/02/2021.
//

import Foundation

// MARK: - SubjectModel
//
struct SubjectModel {
    let subjectName: String
}

// MARK: - SubjectModel Init Helper
//
extension SubjectModel {
    
    init?(field data: SubjectResponse) {
        guard
            let subjectName = data.title else {
            return nil
        }
        self.init(subjectName: subjectName)
    }
}
