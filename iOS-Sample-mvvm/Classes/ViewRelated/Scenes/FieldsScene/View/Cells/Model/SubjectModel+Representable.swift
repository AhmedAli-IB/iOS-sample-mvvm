//
//  SubjectModel+Representable.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 01/02/2021.
//

import Foundation

extension SubjectModel: FieldsCellRepresentable {
    
    var isPicked: Bool {
         isSelected
    }
    var fieldsSubjectName: String {
        subjectName
    }
    
}
