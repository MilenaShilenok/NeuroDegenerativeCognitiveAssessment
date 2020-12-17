//
//  QuestionPartTwo.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 18.11.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

struct QuestionPartTwo {
    let question: String
    var answers: [Option] = []
    
    var type: Option.OptionType {
        return answers.first?.type ?? .text
    }
    
    init(question: String, correctOption: Option) throws {
        self.question = question
        let bank = QuestionsBank.instance
        let wrongOptions = try bank.getRandomOptions { (option) -> Bool in
            return option.type == correctOption.type && option.value != correctOption.value
        }
        answers = wrongOptions + [correctOption]
        answers.shuffle()
    }
    
    init(question: String, answers: [Option]) {
        self.question = question
        self.answers = answers
    }
}
