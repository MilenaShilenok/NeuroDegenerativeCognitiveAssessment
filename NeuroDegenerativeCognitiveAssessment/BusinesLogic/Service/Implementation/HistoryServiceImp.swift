//
//  HistoryPassedTest.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 27.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

class HistoryServiceImp: HistoryService {
    
    var passedTests: [Quiz] = []
    var currentTest: Quiz = Quiz()
    
    private init() {}
    
    static let instance = HistoryServiceImp()
    
    func savePartOne(passedTestPartOne: [AnswerPartOne]) {
        let averageScore = calculateAverageScorePartOne(answers: passedTestPartOne)
        currentTest.partOne = PassedTestPartOne(answers: passedTestPartOne, averageScore: averageScore)
        currentTest.partOne?.answers = passedTestPartOne
    }
    
    private func calculateAverageScorePartOne(answers: [AnswerPartOne]) -> Int {
        var summ = 0
        answers.forEach { (value) in
            summ += value.answer
        }
        
        let averageScore = summ/answers.count * 10
        return averageScore
    }
    
    func savePartTwo(answers: [AnswerPartTwo]) {
        let averageScore = calculateAverageScorePartTwo(answers: answers)
        currentTest.partTwo = PassedTestPartTwo(answers: answers, averageScore: averageScore)
    }
    
    private func calculateAverageScorePartTwo(answers: [AnswerPartTwo]) -> Int {
        var pointsTime: Double = 0
        var pointsRight = 0
        
//        answers.forEach { (answer) in
//            if answer.isCorrect {
//                pointsRight += 1
//                pointsTime += calculatePointsFor(time: answer.time)
//            }
//        }
//
//        for index in 0..<answers.count where answers[index].isCorrect {
//            pointsRight += 1
//            pointsTime += calculatePointsFor(time: answers[index].time)
//        }
//
//        for answer in answers where answer.isCorrect {
//            pointsRight += 1
//            pointsTime += calculatePointsFor(time: answer.time)
//        }
//
//        for (index, answer) in answers.enumerated() {
////            index
////            answer
//        }
        
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
    
    func savePartThree(question: String, answer: String) {
        currentTest.partThree = PassedTestPartThree(question: question, answer: answer, averageScore: calculateAverageScorePartThree(), gunningFogIndex: 15.0)
        
        passedTests.append(currentTest)
        currentTest = Quiz()
    }
    
    private func calculateAverageScorePartThree() -> Int {
        return 100
    }
}
