//
//  HistoryService.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 28.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import UIKit

protocol QuizService {
    var currentTest: Quiz { get }
    var passedTests: [Quiz] { get }
    
    func savePartOne(passedTestPartOne: [AnswerPartOne])
    func savePartTwo(answers: [AnswerPartTwo])
    func savePartThree(answer: PassedTestPartThree) throws
    func saveLastLongAnswer(_ answer: String)
    func getStatus() -> CognitiveBehaviorStatus
    func fetchPassedTests() throws -> [Quiz]
}
