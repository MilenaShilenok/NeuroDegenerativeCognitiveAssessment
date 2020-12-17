//
//  FinishQuizPresenter.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 17.12.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

class FinishQuizPresenter: FinishQuizViewOutput {
    weak var view: FinishQuizViewInput!
    
    init (view: FinishQuizViewInput) {
        self.view = view
    }
    
   /* func displayAverageScore() throws {
        let passedTest = historyService.passedTests.last
        guard let averageScorePartOne = passedTest?.partOne?.averageScore, let averageScorePartTwo = passedTest?.partTwo?.averageScore, let averageScorePartThree = passedTest?.partThree?.averageScore else {
            throw SystemError.averageScoreNotFond
        }
        
        averagePointsLabel.text = passedTest?.averageScore.description
        pointsLabels.forEach { (label) in
            if label.tag == 1 {
                label.text = averageScorePartOne.description
            } else if label.tag == 2 {
                label.text = averageScorePartTwo.description
            } else {
                label.text = averageScorePartThree.description
            }
        }*/
}
