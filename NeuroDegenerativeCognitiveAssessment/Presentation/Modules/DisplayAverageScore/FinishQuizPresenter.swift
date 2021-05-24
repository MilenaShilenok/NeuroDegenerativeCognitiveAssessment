//
//  FinishQuizPresenter.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 17.12.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

class FinishQuizPresenter: FinishQuizViewOutput {
    weak var view: FinishQuizViewInput!
    private let quizService: QuizService = QuizServiceImp.instance
    
    init (view: FinishQuizViewInput) {
        self.view = view
    }
    
    func getPassedTest() throws -> Quiz {
        guard let passedTest = quizService.passedTests.last else {
            throw SystemError.averageScoreNotFond
        }
        return passedTest
    }
}
