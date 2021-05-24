//
//  SubsidiaryPresenter.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 23.12.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

class SubsidiaryPresenter: SubsidiaryViewOutput {
    weak var view: SubsidiaryViewInput!
    let quizService: QuizService = QuizServiceImp.instance
    
    var currentStage: Quiz.Stage {
        return quizService.currentTest.stage
    }
    
    init (view: SubsidiaryViewInput) {
        self.view = view
    }
}
