//
//  PassedTestPartOne.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 27.11.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

struct PassedTestPartOne: Codable {
    var answers: [AnswerPartOne]
    
    var averageScore: Int {
        var summ = 0
        answers.forEach { (value) in
            summ += value.answer
        }
        let averageScore = summ * 10 / answers.count
        return averageScore
    }
    
}
