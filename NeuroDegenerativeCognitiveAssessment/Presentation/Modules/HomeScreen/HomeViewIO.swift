//
//  HomeViewIO.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 20.12.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import UIKit

protocol HomeViewInput: class {
    func setButton(_ state: CurrentButtonState)
}

protocol HomeViewOutput {
    func getStatus() -> CognitiveBehaviorStatus
    func getNextViewControllerName() -> String
    func turnTimer()
}
