//
//  InformationPresenter.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 18.04.2021.
//  Copyright © 2021 Милена. All rights reserved.
//

import Foundation

class InformationPresenter: InformationViewOutput {
    weak var view: InformationViewInput!
    let quizService: QuizService = QuizServiceImp.instance
    
    init(view: InformationViewInput) {
        self.view = view
    }
    
    var information: [Information] {
        let q1 = Information(question: String.Information.question1, answer: String.Information.answer1)
        let q2 = Information(question: String.Information.question2, answer: String.Information.answer2)
        let q3 = Information(question: String.Information.question3, answer: String.Information.answer3)
        let q4 = Information(question: String.Information.question4, answer: String.Information.answer4)
        return [q1, q2, q3, q4]
    }
}
