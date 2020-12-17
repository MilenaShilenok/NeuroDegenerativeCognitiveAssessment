//
//  LongAnswerIO.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 02.12.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

protocol LongAnswerViewInput: class, UIViewInput {
    
}

protocol LongAnswerViewOutput {
    func getQuestion() -> String
    func validate(answer: String) throws
    func save(answer: String)
}
