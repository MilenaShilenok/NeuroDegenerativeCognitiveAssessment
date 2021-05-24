//
//  ExportResultsPresenter.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 03.04.2021.
//  Copyright © 2021 Милена. All rights reserved.
//

import Foundation
import CSV

class ExportResultsPresenter: ExportResultsViewOutput {
    weak var view: ExportResultsViewInput!
    let quizService: QuizService = QuizServiceImp.instance
    
    var hasPassedTests: Bool {
        let tests = (try? quizService.fetchPassedTests()) ?? []
        return !tests.isEmpty
    }
    
    var captionTableCsv: [String] {
        let questionsPartOne =  [String.QuestionsPartOne.question1, String.QuestionsPartOne.question2, String.QuestionsPartOne.question3, String.QuestionsPartOne.question4, String.QuestionsPartOne.question5, String.QuestionsPartOne.question6, String.QuestionsPartOne.question7, String.QuestionsPartOne.question8]
        let caption = [String.Information.date, String.Information.averageTime, String.Information.partOne, String.Information.partTwo, String.Information.partThree,] + questionsPartOne + [String.Information.averageTime, String.Information.correctAnswers, String.Information.questionPartThree, String.Information.answerPartThree, String.Information.gunningFog]
        return caption
    }
    
    init(view: ExportResultsViewInput) {
        self.view = view
    }

    func getFileUrl() throws -> URL {
        let temporaryDir = NSTemporaryDirectory()
        let path = (temporaryDir as NSString).appendingPathComponent(String.fileName)
        var url = URL(fileURLWithPath: path)
        url.appendPathExtension("csv")
        
        try writeToFile(url: url)
        
        return url
    }
    
    private func writeToFile(url: URL) throws {
        guard let stream = OutputStream(url: url, append: false) else {
            throw SystemError.failedToCreateFile
        }

        do {
            let csv = try CSVWriter(stream: stream)
            try csv.write(row: captionTableCsv)
            let passedTests = try quizService.fetchPassedTests()
            for passedTest in passedTests {
                let lineContent = getLineContent(passedTest: passedTest)
                try csv.write(row: lineContent)
            }
            csv.stream.close()
        } catch {
            throw error
        }
    }
    
    private func getLineContent(passedTest: Quiz) -> [String] {
        guard let date = passedTest.completionDate,
              let partOne = passedTest.partOne,
              let partTwo = passedTest.partTwo,
              let partThree = passedTest.partThree else {
            return []
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd"
        let dateDescription = dateFormatter.string(from: date)
        let averageScore = passedTest.averageScore.description
        let pointsPartOne = partOne.averageScore.description
        let pointsPartTwo = partTwo.averageScore.description
        let pointsPartThree = partThree.averageScore.description
        let averageTime = getAverageTime(partTwo).description
        let correctAnswersPercent = getCorrectAnswersPercent(partTwo).description + "%"
        
        var questionsPartOne: [String] = []
        var answersPartOne: [String] = []
        partOne.answers.forEach { (answerPartOne) in
            questionsPartOne.append(answerPartOne.question)
            answersPartOne.append(answerPartOne.answer.description)
        }

        let lineContent = [dateDescription, averageScore, pointsPartOne, pointsPartTwo, pointsPartThree] + answersPartOne + [averageTime, correctAnswersPercent, partThree.question, partThree.answer, partThree.gunningFogIndex.description]
        return lineContent
    }
    
    private func getAverageTime(_ partTwo: PassedTestPartTwo) -> Double {
        var averageTime = 0.0
        partTwo.answers.forEach { (answer) in
            averageTime += answer.time
        }
        averageTime = averageTime / Double(partTwo.answers.count)
        averageTime.roundUp(numberOfDecimalPlaces: 2)
        return averageTime
    }
    
    private func getCorrectAnswersPercent(_ partTwo: PassedTestPartTwo) -> Int {
        var correctAnswersCount = 0
        partTwo.answers.forEach { (answer) in
            if answer.isCorrect {
                correctAnswersCount += 1
            }
        }
        let correctAnswersPercent = 100 * correctAnswersCount / partTwo.answers.count
        return correctAnswersPercent
    }
}
