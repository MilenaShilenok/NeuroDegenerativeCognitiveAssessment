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
    let quizService: QuizService = QuizServiceImp.instance
    weak var view: SelfEfficacyViewInput!
    
    var passedTestPartOne: [AnswerPartOne] = []
    let questionsCount = 8
    var currentQuestionIndex = 0
    
    init (view: SelfEfficacyViewInput) {
        self.view = view
    }
    
    func viewIsReady() {
        view.setupInitialState()
    }
    
    func getCurrentProgress() -> Float {
        let oneSlice = 1.0/Float(bank.partOne.count)
        let progress = oneSlice * Float(passedTestPartOne.count)
        return progress
    }
    
    func didSelect(answer: Int) {
        let question = bank.partOne[currentQuestionIndex]
        let answer = AnswerPartOne(question: question, answer: answer, index: currentQuestionIndex)
        save(answer: answer)
    }
    
    func save(answer: AnswerPartOne) {
        var index = 0
        while index < passedTestPartOne.count && passedTestPartOne[index].question != answer.question  {
            index += 1
        }
        
        if index < passedTestPartOne.count {
            passedTestPartOne[index].answer = answer.answer
        } else {
            passedTestPartOne.append(answer)
        }
        
        view.updateScreen()
        
        if partIsPassed() {
            quizService.savePartOne(passedTestPartOne: passedTestPartOne)
            passedTestPartOne = []
            view.openNextViewController()
        }
        
        quizService.saveLastLongAnswer("")
    }
    
    func partIsPassed() -> Bool {
        return passedTestPartOne.count == bank.partOne.count
    }
    
    func updateButtonBar() -> [Int] {
        var passedQuestionsIndexes: [Int] = []
        passedTestPartOne.forEach { (answer) in
            passedQuestionsIndexes.append(answer.index)
        }
        return passedQuestionsIndexes
    }
    
    func getAnswer(index: Int) -> AnswerPartOne {
        var i = 0
        while i < passedTestPartOne.count && index != passedTestPartOne[i].index {
            i += 1
        }
        
        if isContainsAnswer(i) {
            return passedTestPartOne[i]
        } else {
            let defaultAnswer = 5
            let question = AnswerPartOne(question: bank.partOne[index], answer: defaultAnswer, index: index)
            return question
        }
    }
    
    func isContainsAnswer(_ index: Int) -> Bool {
        return index < passedTestPartOne.count
    }
    
    func getQuestion(index: Int?) -> AnswerPartOne {
        var questionIndex = 0
        if let index = index {
            questionIndex = index
        } else {
            questionIndex = getMissingQuestionIndex()
        }
        
        currentQuestionIndex = questionIndex
        let question = getAnswer(index: questionIndex)
        return question
    }
    
    func getMissingQuestionIndex() -> Int {
        var answeredQuestionsIndexes: [Int] = []
        passedTestPartOne.forEach { (answer) in
            answeredQuestionsIndexes.append(answer.index)
        }
        
        var missingIndex = 0
        while missingIndex < questionsCount && answeredQuestionsIndexes.contains(missingIndex) {
            missingIndex += 1
        }
        return missingIndex >= questionsCount ? 0 : missingIndex
    }
}
