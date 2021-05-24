//
//  HistorySelfEfficacyPresenter.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 18.02.2021.
//  Copyright © 2021 Милена. All rights reserved.
//

import Foundation

class HistorySelfEfficacyPresenter: HistorySelfEfficacyViewOutput {
    weak var view: HistorySelfEfficacyViewInput!
    private let questionBank = QuestionsBank.instance
    
    init(view: HistorySelfEfficacyViewInput) {
        self.view = view
    }
}
