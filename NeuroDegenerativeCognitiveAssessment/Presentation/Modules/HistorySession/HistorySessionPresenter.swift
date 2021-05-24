//
//  HistorySessionPresenter.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 18.02.2021.
//  Copyright © 2021 Милена. All rights reserved.
//

import Foundation

class HistorySessionPresenter: HistorySessionViewOutput {
    weak var view: HistorySessionViewInput!
    let quizService: QuizService = QuizServiceImp.instance
    
    init (view: HistorySessionViewInput) {
        self.view = view
    }
}
