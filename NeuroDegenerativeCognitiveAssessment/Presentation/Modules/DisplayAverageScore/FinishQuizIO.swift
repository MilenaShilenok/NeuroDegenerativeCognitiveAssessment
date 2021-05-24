//
//  FinishQuizIO.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 17.12.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

protocol FinishQuizViewInput: class, UIViewInput {
    
}

protocol FinishQuizViewOutput {
    func getPassedTest() throws -> Quiz
}
