//
//  ValidationError.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 14.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

enum ValidationError: LocalizedError {
    case emptyFields
    case shortName
    case wrongEmail
    case wrongAge
    
    var errorDescription: String? {
        switch self {
        case .emptyFields:
            return String.Error.fillAllFields
        case .shortName:
            return String.Error.shortName
        case .wrongEmail:
            return String.Error.wrongEmail
        case .wrongAge:
            return String.Error.wrongAge
        }
    }
}
