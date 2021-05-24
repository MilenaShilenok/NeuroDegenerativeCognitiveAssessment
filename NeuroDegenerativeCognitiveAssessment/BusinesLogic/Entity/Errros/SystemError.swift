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
    case indexOutOfRange
    case historyUnavailable
    case failedFetchPassedTests
    case encodingError
    case noAccessToAppDelegate
    case failedToDeleteHistory
    case failedToCreateFile
    case optionNotSelected
    case custom(String)
  
    var errorDescription: String? {
        switch self {
        case .somethingWentWrong:
            return String.Error.somethingWentWrong
        case .profileNotFound:
            return String.Error.profileNotFound
        case .averageScoreNotFond:
            return String.Error.averageScoreNotFound
        case .indexOutOfRange:
            return String.Error.indexOutOfRange
        case .historyUnavailable:
            return String.Error.historyUnavailable
        case .failedFetchPassedTests:
            return String.Error.failedFetchPassedTests
        case .encodingError:
            return String.Error.encodingError
        case .noAccessToAppDelegate:
            return String.Error.noAccessToAppDelegate
        case .failedToDeleteHistory:
            return String.Error.failedToDeleteHistory
        case .failedToCreateFile:
            return String.Error.failedToCreateFile
        case .optionNotSelected:
            return String.Error.optionNotSelected
        case .custom(let message):
            return message
        }
    }
}
