//
//  UIView.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 16.12.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    
    private func makeLabel(value: Int) {
        let x = frame.origin.x
        let a = self.bounds.size.height / 2
        print(x)
        let y = frame.origin.y
        print(y)
        let averageScoreLabel = UILabel(frame: CGRect(x: a, y: a, width: 100, height: 20))
       
          //label.center = CGPointMake(160, 284)
         // label.textAlignment = NSTextAlignment.Center
        averageScoreLabel.textColor = .black
        averageScoreLabel.tex
        averageScoreLabel.text = value.description
        self.addSubview(averageScoreLabel)
    }
   /* func drawСircle(view: UIView) {
        let cornerRadius = view.bounds.size.height / 2
        view.layer.cornerRadius = cornerRadius
        view.clipsToBounds = true
        view.layer.borderWidth = 7
        view.layer.borderColor = UIColor.blue.cgColor
    }
    
    func displayAverageScore() throws {
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
        }
    }*/
    private func drawCircle() {
        let cornerRadius = bounds.size.height / 2
       // print(bounds.size)
       // print(cornerRadius)
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
        layer.borderWidth = 7
        layer.borderColor = UIColor.blue.cgColor
    }
    
    func drawCircleWith(value: Int) {
        drawCircle()
        makeLabel(value: value)
    }
}
