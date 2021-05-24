//
//  PassedTestPartThree.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 27.11.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

struct PassedTestPartThree: Codable {
    let question: String
    var answer: String
    let gunningFogIndex: Double
    
    var averageScore: Int {
        let base = 1.026
        var result = base
        var index = 1
        while result < gunningFogIndex {
            result *= base
            index += 1
        }
        if index > 100 {
            index = 100
        }
        return index
    }
}
