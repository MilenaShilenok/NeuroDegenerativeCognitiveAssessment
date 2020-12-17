//
//  ShortAnswerIO.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 04.11.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

protocol ShortAnswerViewInput: class {
    func setupInitialState()
    func display(_ question: QuestionPartTwo)
    func openNextViewController()
}

protocol ShortAnswerViewOutput {
    var questions: [QuestionPartTwo] { get }
    
    func viewIsReady()
    func didSelect(_ selectedOption: Option)
    func getCurrentProgress() -> Float
}
