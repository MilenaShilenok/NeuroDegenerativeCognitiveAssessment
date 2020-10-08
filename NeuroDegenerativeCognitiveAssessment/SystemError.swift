//
//  Error.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 04.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

enum SystemError: LocalizedError {
    case emptyFields
    case custom(String)
  
    var errorDescription: String? {
        switch self {
        case .emptyFields:
            return "Fill in all the fields"
        case .custom(let message):
            return message
        }
    }
}
