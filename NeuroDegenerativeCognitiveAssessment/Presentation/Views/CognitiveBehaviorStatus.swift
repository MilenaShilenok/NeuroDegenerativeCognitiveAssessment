//
//  CognitiveBehaviorStatus.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 13.02.2021.
//  Copyright © 2021 Милена. All rights reserved.
//

import UIKit

enum CognitiveBehaviorStatus {
    case notDetermined
    case positive
    case negative
    
    var name: String {
        switch self {
        case .notDetermined:
            return String.Status.notDetermined
        case .negative:
            return String.Status.negativeState
        case .positive:
            return String.Status.positiveStatus
        }
    }
    
    var color: CGColor {
        switch self {
        case .notDetermined:
            return UIColor.gray.cgColor
        case .negative:
            return UIColor.red.cgColor
        case .positive:
            return UIColor.green.cgColor
        }
    }
}
