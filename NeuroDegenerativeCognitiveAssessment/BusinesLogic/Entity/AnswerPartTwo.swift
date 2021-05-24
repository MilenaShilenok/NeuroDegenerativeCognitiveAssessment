//
//  AnswerPartTwo.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 20.11.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

struct AnswerPartTwo: Codable {
    let question: String
    var option: Option
    let time: Double
    
    var isCorrect: Bool {
        return option.isCorrect
    }
}






