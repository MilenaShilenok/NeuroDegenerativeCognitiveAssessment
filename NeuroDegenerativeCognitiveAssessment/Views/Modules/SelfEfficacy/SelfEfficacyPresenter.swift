//
//  SelfEfficacyPresenter.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 21.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

class SelfEfficacyPresenter: SelfEfficacyViewOutput {
    private let bank = QuestionsBank.instance
    weak var view: SelfEfficacyViewInput!
    
    var passedTestPartOne: [AnswerPartOne] = []
    var questionIndex = 0
    var questionsCount = 8 // !!!!
    
    let historyService: HistoryService = HistoryServiceImp.instance
   
    init (view: SelfEfficacyViewInput) {
        self.view = view
    }
    
    func getQuestion() -> String {
        var question = ""
        if questionIndex < bank.partOne.count {
            question = bank.partOne[questionIndex]
        }
        return question
    }
    
    func getCurrentProgress() -> Float {
        let oneShare = 1.0/Float(bank.partOne.count)
        let progress = oneShare * Float(questionIndex)
        return progress
    }
    
    func save(answer: Int) {
        if questionIndex < bank.partOne.count {
            let answer = AnswerPartOne(question: bank.partOne[questionIndex], answer: answer)
            passedTestPartOne.append(answer)
        }
        
        if questionIndex + 1 == bank.partOne.count {
            historyService.savePartOne(passedTestPartOne: passedTestPartOne)
            passedTestPartOne = []
            view.openNextViewController()
        }
        questionIndex += 1
    }
}
