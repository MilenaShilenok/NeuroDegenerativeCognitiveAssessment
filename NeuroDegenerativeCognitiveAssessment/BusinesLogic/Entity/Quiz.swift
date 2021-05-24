//
//  Test.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 27.11.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

struct Quiz: Codable {
    enum Stage: Int, Codable {
        case partOne
        case partTwo
        case partThree
    }
    
    var completionDate: Date?
    var partOne: PassedTestPartOne?
    var partTwo: PassedTestPartTwo?
    var partThree: PassedTestPartThree?
    var lastLongAnswer: String?
    
    var stage: Stage {
        if partOne == nil {
            return .partOne
        }
        if partTwo == nil {
            return .partTwo
        }
        return .partThree
    }
    
    var averageScore: Int {
        if let partOne = partOne?.averageScore, let partTwo = partTwo?.averageScore, let partThree = partThree?.averageScore {
            let averageScore = (partOne + partTwo + partThree) / 3
            return averageScore
        }
        return 0
    }
    
    var isCompeted: Bool {
        return completionDate != nil && partOne != nil && partThree != nil && partTwo != nil
    }
    
    init(completionDate: Date? = nil, partOne: PassedTestPartOne? = nil, partTwo: PassedTestPartTwo? = nil, partThree: PassedTestPartThree? = nil, lastLongAnswer: String? = nil) {
        self.completionDate = completionDate
        self.partOne = partOne
        self.partTwo = partTwo
        self.partThree = partThree
        self.lastLongAnswer = lastLongAnswer
    }
}
