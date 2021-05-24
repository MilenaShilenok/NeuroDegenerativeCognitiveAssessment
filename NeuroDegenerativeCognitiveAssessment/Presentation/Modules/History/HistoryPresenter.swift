//
//  HistoryPresenter.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 22.02.2021.
//  Copyright © 2021 Милена. All rights reserved.
//

import Foundation

class HistoryPresenter: HistoryViewOutput {
    weak var view: HistoryViewInput!
    let quizService: QuizService = QuizServiceImp.instance
    
    init(view: HistoryViewInput) {
        self.view = view
    }
    
    func fetchPassedTests() -> [Quiz] {
        let passedTests = try? quizService.fetchPassedTests()
        if let passedTests = passedTests {
            return passedTests
        }
        return []
    }
    
    func getPassedTestsPoints() -> [Point] {
        guard let passedTests = try? quizService.fetchPassedTests() else {
            return []
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd"
        var points: [Point] = []
        for i in 0..<passedTests.count {
            let date = passedTests[i].completionDate ?? Date()
            let dateDescription = dateFormatter.string(from: date)
            let x = Double(i + 1)
            let y = Double(passedTests[i].averageScore)
            
            let point = Point(x: x, y: y, dateDescription: dateDescription)
            points.append(point)
        }
        return points
    }
}
