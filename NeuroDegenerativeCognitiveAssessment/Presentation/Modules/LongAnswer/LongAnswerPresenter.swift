//
//  LongAnswerPresenter.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 02.12.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

class LongAnswerPresenter: LongAnswerViewOutput {
    let quizService: QuizService = QuizServiceImp.instance
    let longAnswerService: LongAnswerService = LongAnswerServiceImp.instance
    private let bank = QuestionsBank.instance
    weak var view: LongAnswerViewInput!
    
    init (view: LongAnswerViewInput) {
        self.view = view
    }
    
    var question: String = ""
    
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
    
    func getLastAnswer() -> String {
        return quizService.currentTest.lastLongAnswer ?? ""
    }
    
    func saveLastAnswer(_ answer: String) {
        quizService.saveLastLongAnswer(answer)
    }
    
    func gaveAnswer(answer: String) {
        do {
            try validate(answer: answer)
        } catch {
            view.show(error: error)
            return
        }
        view.startLoading()
        longAnswerService.getGunningFog(text: answer) { [weak self] (points, error) in
            if let points = points, let question = self?.question {
                let longAnswer = PassedTestPartThree(question: question, answer: answer, gunningFogIndex: points)
                try? self?.quizService.savePartThree(answer: longAnswer)
                self?.view.openNextViewController()
            }
            if let error = error {
                self?.view.stopLoading()
                self?.view.show(error: error)
            }
        }
    }
}
