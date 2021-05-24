//
//  HistoryShortAnswerPresenter.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 16.02.2021.
//  Copyright © 2021 Милена. All rights reserved.
//

import Foundation

class HistoryShortAnswerPresenter: HistoryShortAnswerViewOutput {
    weak var view: HistoryShortAnswerViewInput!
    let quizService: QuizService = QuizServiceImp.instance
    
    init(view: HistoryShortAnswerViewInput) {
        self.view = view
    }
}
