//
//  HistoryLongAnswerPresenter.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 18.02.2021.
//  Copyright © 2021 Милена. All rights reserved.
//

import Foundation

class HistoryLongAnswerPresenter: HistoryLongAnswerViewOutput {
    weak var view: HistoryLongAnswerViewInput!
    let quizService: QuizService = QuizServiceImp.instance
    
    init(view: HistoryLongAnswerViewInput) {
        self.view = view
    }
}
