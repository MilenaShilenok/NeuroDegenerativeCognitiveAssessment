//
//  HistoryViewIO.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 22.02.2021.
//  Copyright © 2021 Милена. All rights reserved.
//

import Foundation

protocol HistoryViewInput: class, UIViewInput {
    
}

protocol HistoryViewOutput {
    func fetchPassedTests() -> [Quiz]
    func getPassedTestsPoints() -> [Point]
}
