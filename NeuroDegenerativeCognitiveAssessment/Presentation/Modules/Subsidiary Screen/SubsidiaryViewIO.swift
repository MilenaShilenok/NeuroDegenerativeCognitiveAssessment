//
//  SubsidiaryViewIO.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 23.12.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

protocol SubsidiaryViewInput: class {
    
}

protocol SubsidiaryViewOutput {
    var currentStage: Quiz.Stage { get }
}
