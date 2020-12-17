//
//  LongAnswerPresenter.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 02.12.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

class LongAnswerPresenter: LongAnswerViewOutput {
    let historyService: HistoryService = HistoryServiceImp.instance
    private let bank = QuestionsBank.instance
    weak var view: LongAnswerViewInput!
    
    var question = ""
    
    init (view: LongAnswerViewInput) {
        self.view = view
    }
    
    func getQuestion() -> String {
        question = bank.getRandomQuestionPartThree()
        return question
    }
    
    func validate(answer: String) throws {
        let minSizeForAnswer = 100
        if answer == "" {
            throw ValidationError.emptyFields
        } else if answer.count < minSizeForAnswer {
            throw ValidationError.shortAnswer
        }
    }
    
    func save(answer: String) {
        historyService.savePartThree(question: question, answer: answer)
    }
    
    
}
