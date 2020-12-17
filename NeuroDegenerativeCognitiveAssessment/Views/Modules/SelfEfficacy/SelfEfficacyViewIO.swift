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
}

protocol SelfEfficacyViewOutput {
    var questionsCount: Int { get }
    
    func getQuestion() -> String
    func save(answer: Int)
    func getCurrentProgress() -> Float
}
