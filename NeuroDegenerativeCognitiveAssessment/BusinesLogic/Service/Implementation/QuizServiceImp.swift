//
//  HistoryPassedTest.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 27.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import UIKit
import CoreData

class QuizServiceImp: QuizService {
    
    var passedTests: [Quiz] = []
    var currentTest: Quiz = Quiz()
    
    static let instance = QuizServiceImp()
    private init() {}

    func savePartOne(passedTestPartOne: [AnswerPartOne]) {
        currentTest.partOne = PassedTestPartOne(answers: passedTestPartOne)
    }
    
    func savePartTwo(answers: [AnswerPartTwo]) {
        currentTest.partTwo = PassedTestPartTwo(answers: answers)
    }

    func savePartThree(answer: PassedTestPartThree) throws {
        currentTest.partThree = answer
        currentTest.completionDate = Date()
        passedTests.append(currentTest)
        try saveToCoreData()
        currentTest = Quiz()
    }

    private func saveToCoreData() throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        guard let data = try? encoder.encode(currentTest) else {
            throw SystemError.encodingError
        }

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            throw SystemError.noAccessToAppDelegate
        }
        let context = appDelegate.persistentContainer.viewContext
        let session = PassedTest(context: context)
        session.sessionJsonData = data

        try context.save()
    }
    
    func saveLastLongAnswer(_ answer: String) {
        currentTest.lastLongAnswer = answer
    }

    func getStatus() -> CognitiveBehaviorStatus  {
        let status: CognitiveBehaviorStatus  = .notDetermined
        guard let passedTests = try? fetchPassedTests() else {
            return status
        }
        if passedTests.count < 3 {
            return status
        } else {
            return calculateStatus()
        }
    }

    private func calculateStatus() -> CognitiveBehaviorStatus  {
        var status: CognitiveBehaviorStatus = .notDetermined
        guard let passedTests = try? fetchPassedTests() else {
            return status
        }
        
        var points: [(x: Double, y: Double)] = []
        for i in 0..<passedTests.count {
            let x = Double(i + 1)
            let y = Double(passedTests[i].averageScore)
            points.append((x: x, y: y))
        }
        let slope = lineOfBestFit(points: points)
        if slope < 0 {
            status = .negative
        } else {
            status = .positive
        }
        return status
    }
    
    func lineOfBestFit(points: [(x: Double, y: Double)]) -> Double {
        var sumX: Double = 0
        for element in points {
            sumX += element.x
        }
        let meanX = sumX/Double(points.count)
            
        var sumY: Double = 0
        for element in points {
            sumY += element.y
        }
        let meanY = sumY/Double(points.count)
            
        var productXY: Double = 0
        for i in 0..<points.count {
            let left = points[i].x - meanX
            let right = points[i].y - meanY
            productXY += left * right
        }
            
        var productXX: Double = 0
        for i in 0..<points.count {
            let deviationFromMeanX = points[i].x - meanX
            productXX += deviationFromMeanX * deviationFromMeanX
        }
            
        let slope: Double = productXY/productXX
        return slope
    }
    
    func fetchPassedTests() throws -> [Quiz] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            throw SystemError.noAccessToAppDelegate
        }
        let context = appDelegate.persistentContainer.viewContext
        guard let passedTests = try? context.fetch(PassedTest.fetchRequest()) else {
            throw SystemError.historyUnavailable
        }
        let decoder = JSONDecoder()
        decoder.dataDecodingStrategy = .deferredToData
        
        var result: [Quiz] = []
        for index in 0..<passedTests.count {
            guard let passedTest = passedTests[index] as? PassedTest,
                  let session = passedTest.sessionJsonData,
                  let test = try? decoder.decode(Quiz.self, from: session) else {
                throw SystemError.failedFetchPassedTests
            }
            result.append(test)
        }
        return result
    }
}
