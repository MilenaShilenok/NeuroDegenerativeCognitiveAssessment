//
//  LongAnswerIO.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 02.12.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

protocol LongAnswerViewInput: class, UIViewInput {
    func openNextViewController()
    func startLoading()
    func stopLoading()
}

protocol LongAnswerViewOutput {
    func getQuestion() -> String
    func gaveAnswer(answer: String)
    func getLastAnswer() -> String
    func saveLastAnswer(_ answer: String)
}
