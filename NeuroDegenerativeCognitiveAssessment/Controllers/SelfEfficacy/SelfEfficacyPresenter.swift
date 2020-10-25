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
    
    init (view: SelfEfficacyViewInput) {
        self.view = view
    }
    
    func getQuestion(number: Int) -> QuestionPart1 {
        let question = bank.part1[number]
        return question
    }
    
    func save(number: Int, answer: Int) {
        bank.part1[number].answer = answer
    }
}
