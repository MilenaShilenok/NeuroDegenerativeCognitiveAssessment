//
//  SelfEfficacyViewIO.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 21.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

protocol SelfEfficacyViewInput: class {
    
}

protocol SelfEfficacyViewOutput {
    func getQuestion(number: Int) -> QuestionPart1
    func save(number: Int, answer: Int)
}
