//
//  PassedTestPartTwo.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 27.11.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

struct PassedTestPartTwo: Codable {
    let answers: [AnswerPartTwo]
    
    var averageScore: Int {
        var pointsTime: Double = 0
        var pointsRight = 0
        
        for i in 0..<answers.count {
            if answers[i].isCorrect {
                pointsRight += 1
                pointsTime += calculatePointsFor(time: answers[i].time)
            }
        }
        let averageScoreTime = Int(100 * pointsTime) / (answers.count)
        let averageScoreRight = Int(100 * pointsRight) / (answers.count)
        let averageScore = (averageScoreTime + averageScoreRight) / 2
        return averageScore
    }
    
    private func calculatePointsFor(time: Double) -> Double {
        let worseTime: Double = 5
        let perfectTime: Double = 2
        let maxPoint = 1.0
        let minPoint = 0.0
        let k = 1.0 / (perfectTime - worseTime)
        let ofset = -worseTime * k
        
        if time < perfectTime {
            return maxPoint
        } else if time > worseTime {
            return minPoint
        } else {
            let point = time * k + ofset
            return point
        }
    }
}
