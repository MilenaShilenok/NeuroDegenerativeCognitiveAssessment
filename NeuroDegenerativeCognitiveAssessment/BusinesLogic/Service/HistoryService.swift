//
//  HistoryService.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 28.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

protocol HistoryService {
    var currentTest: Quiz { get }
    var passedTests: [Quiz] { get }
    
    func savePartOne(passedTestPartOne: [AnswerPartOne])
    func savePartTwo(answers: [AnswerPartTwo])
    func savePartThree(question: String, answer: String)
}
