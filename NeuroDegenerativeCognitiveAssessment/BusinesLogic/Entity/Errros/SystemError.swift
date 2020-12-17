//
//  Error.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 04.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

enum SystemError: LocalizedError {
    case somethingWentWrong
    case profileNotFound
    case averageScoreNotFond
    case custom(String)
  
    var errorDescription: String? {
        switch self {
        case .somethingWentWrong:
            return String.Error.somethingWentWrong
        case .profileNotFound:
            return String.Error.profileNotFound
        case .averageScoreNotFond:
            return String.Error.averageScoreNotFound
        case .custom(let message):
            return message
        }
    }
}
