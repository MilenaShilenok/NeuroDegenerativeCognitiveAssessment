//
//  ShortAnswerPresenter.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 04.11.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

class ShortAnswerPresenter: ShortAnswerViewOutput {
    let quizService: QuizService = QuizServiceImp.instance
    private let bank = QuestionsBank.instance
    weak var view: ShortAnswerViewInput!
    var responseDate: TimeInterval!
    
    private let questionsCount = 8
    var questionIndex = 0
    
    var questions: [QuestionPartTwo] = []
    var answersPartTwo: [AnswerPartTwo] = []
    
    init (view: ShortAnswerViewInput) {
        self.view = view
        questions = bank.getQuestionPartTwo(count: questionsCount)
    }
    
    func viewIsReady() {
        view.setupInitialState()
        guard let firstQuestion = questions.first else {
           return
        }
        view.display(firstQuestion)
        startTimer()
    }
   
    private func nextQuestion() {
        if questionIndex + 1 < questions.count {
            questionIndex += 1
            let question = questions[questionIndex]
            view.display(question)
            startTimer()
        } else {
            view.openNextViewController()
        }
    }
    
    private func save(option: Option) {
        var time = Double(responseDate)
        time.roundUp(numberOfDecimalPlaces: 2)
        let question = questions[questionIndex].question
        let answer = AnswerPartTwo(question: question, option: option, time: time)
        answersPartTwo.append(answer)
        if answersPartTwo.count == questions.count {
            quizService.savePartTwo(answers: answersPartTwo)
        }
    }
    
    func didSelect(_ option: Option) {
        let time = Date().timeIntervalSince1970
        responseDate = time - responseDate
        save(option: option)
        nextQuestion()
    }
    
    func getCurrentProgress() -> Float {
        let oneShare = 1.0/Float(questionsCount)
        let progress = oneShare * Float(questionIndex + 1)
        return progress
    }
    
    func startTimer() {
        responseDate = Date().timeIntervalSince1970
    }
}
