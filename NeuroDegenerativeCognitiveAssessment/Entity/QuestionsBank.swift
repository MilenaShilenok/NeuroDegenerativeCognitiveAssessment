//
//  QuestionsPart1.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 21.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation
import UIKit

struct QuestionPart1 {
    let question: String
    var answer: Int?
}

class QuestionsBank {
    var part1: [QuestionPart1]
    
    static let instance = QuestionsBank()
    
    private init () {
        let question_1 = QuestionPart1(question: String.QuestionsPart1.question1, answer: nil)
        var question_2 = QuestionPart1(question: String.QuestionsPart1.question2, answer: nil)
        var question_3 = QuestionPart1(question: String.QuestionsPart1.question3, answer: nil)
        var question_4 = QuestionPart1(question: String.QuestionsPart1.question4, answer: nil)
        var question_5 = QuestionPart1(question: String.QuestionsPart1.question5, answer: nil)
        var question_6 = QuestionPart1(question: String.QuestionsPart1.question6, answer: nil)
        var question_7 = QuestionPart1(question: String.QuestionsPart1.question7, answer: nil)
        var question_8 = QuestionPart1(question: String.QuestionsPart1.question8, answer: nil)
        
        part1 = [question_1, question_2, question_3, question_4, question_5, question_6, question_7, question_8]
    }
}
