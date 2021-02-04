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
    let id: String
    let subjectName: String
    var isSelected: Bool = false
}

// MARK: - SubjectModel Init Helper
//
extension SubjectModel {
    
    init?(field data: SubjectResponse) {
        guard
            let subjectName = data.title,
            let id = data.id else {
            return nil
        }
        self.init(id: id, subjectName: subjectName)
    }
}

extension SubjectModel: Equatable {
    /// Returns whether the two schemas are equal.
    public static func == (lhs: SubjectModel, rhs: SubjectModel) -> Bool {
        return lhs.id.isEqual(rhs.id)
    }
}
