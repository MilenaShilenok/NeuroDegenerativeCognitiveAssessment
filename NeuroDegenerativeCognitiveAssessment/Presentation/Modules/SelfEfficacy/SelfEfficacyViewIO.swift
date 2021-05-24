//
//  SelfEfficacyViewIO.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 21.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

protocol SelfEfficacyViewInput: class {
    func openNextViewController()
    func updateScreen()
    func setupInitialState()
}

protocol SelfEfficacyViewOutput {
    var questionsCount: Int { get }
    var currentQuestionIndex: Int { get }
    
    func viewIsReady()
    func getQuestion(index: Int?) -> AnswerPartOne
    func save(answer: AnswerPartOne)
    func getCurrentProgress() -> Float
    func getAnswer(index: Int) -> AnswerPartOne
    func getMissingQuestionIndex() -> Int
    func didSelect(answer: Int)
}
