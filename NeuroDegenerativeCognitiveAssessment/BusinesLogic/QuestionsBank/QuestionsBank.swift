//
//  QuestionsPart1.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 21.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation
import UIKit

class QuestionsBank {
    
    lazy var partOne: [String] = {
        return initPartOne()
    }()
    
    lazy var partTwo: [QuestionPartTwo] = {
        return initQuestionsAndOptionsPartTwo()
    }()
    
    lazy var partThree: [String] = {
        return initQuestionsPartThree()
    }()
    
    var optionsPartTwo: [Option] = []
    //lazy var optionsPartTwo: [Option] = {
      //  initOptionsPartTwo()
    //}()
   // var optionsPartTwo: [String: Option] = [:]
    
    static let instance = QuestionsBank()
    private let bank = FormationOfQuestions.instance
    
    func getQuestionPartTwo(count: Int) -> [QuestionPartTwo] {
        var randomQuestions: [QuestionPartTwo] = []
        let percent = count * 100 / partTwo.count
        let maxRange = 70
        if percent >= maxRange {
            partTwo.shuffle()
            randomQuestions = getQuestionsForSmallCount(count: count)
        } else {
            randomQuestions = getQuestionsForBigCount(count: count)
        }
        return randomQuestions
    }
    
    private func getQuestionsForBigCount(count: Int) -> [QuestionPartTwo] {
        var textQuestions: [QuestionPartTwo] = []
        var imageQuestions: [QuestionPartTwo] = []
        var currentQuestionsCount = textQuestions.count + imageQuestions.count
        
        while currentQuestionsCount < count {
            let randomIndex = Int.random(in: 0..<partTwo.count)
            let randomQuestion = partTwo[randomIndex]
            let isContainsText = textQuestions.contains(where: {$0.question == randomQuestion.question})
            let isContainsImage = imageQuestions.contains(where: {$0.question == randomQuestion.question})
            
            if randomQuestion.type == .text && textQuestions.count <= count/2 && !isContainsText {
                textQuestions.append(randomQuestion)
            }
            if randomQuestion.type == .image && imageQuestions.count <= count/2 && !isContainsImage {
                imageQuestions.append(randomQuestion)
            }
            currentQuestionsCount = textQuestions.count + imageQuestions.count
        }
        
        var randomQuestions = textQuestions + imageQuestions
        randomQuestions.shuffle()
        
        return randomQuestions
    }
    
    private func getQuestionsForSmallCount(count: Int) -> [QuestionPartTwo] {
        var questionPartTwo: [QuestionPartTwo] = []
        var textQuestionCount = 0
        var imageQuestionCount = 0
        var i = 0
        while questionPartTwo.count < count && i < partTwo.count {
            if partTwo[i].type == .text && textQuestionCount <= count/2 {
                questionPartTwo.append(partTwo[i])
                textQuestionCount += 1
            }
            if partTwo[i].type == .image && imageQuestionCount <= count/2 {
                questionPartTwo.append(partTwo[i])
                imageQuestionCount += 1
            }
            i += 1
        }

        return questionPartTwo
    }
    
    private func initPartOne() -> [String] {
        let question_1 = String.QuestionsPartOne.question1
        let question_2 = String.QuestionsPartOne.question2
        let question_3 = String.QuestionsPartOne.question3
        let question_4 = String.QuestionsPartOne.question4
        let question_5 = String.QuestionsPartOne.question5
        let question_6 = String.QuestionsPartOne.question6
        let question_7 = String.QuestionsPartOne.question7
        let question_8 = String.QuestionsPartOne.question8
        
        return [question_1, question_2, question_3, question_4, question_5, question_6, question_7, question_8]
    }
    
    private func initOptionsPartTwo() -> [Option] {
        return bank.getOptionsPartTwo()
    }
    
    private func initQuestionsAndOptionsPartTwo() -> [QuestionPartTwo] {
        let cat = Option(imageName: "cat")
        let dog = Option(imageName: "dog")
        let elephant = Option(imageName: "elephant")
        let rat = Option(imageName: "rat")
        let raccoon = Option(imageName: "raccoon")
        let giraffe = Option(imageName: "giraffe")
        let lion = Option(imageName: "lion")
        let hedgehog = Option(imageName: "hedgehog")
        let rabbit = Option(imageName: "rabbit")
        let cow = Option(imageName: "cow")
        let zebra = Option(imageName: "zebra")
        let panda = Option(imageName: "panda")
        let tiger = Option(imageName: "tiger")
        let owl = Option(imageName: "owl")
        let penguin = Option(imageName: "penguin")
        let bear = Option(imageName: "bear")
        let deer = Option(imageName: "deer")
        let swan = Option(imageName: "swan")
        let squirrel = Option(imageName: "squirrel")
        let monkey = Option(imageName: "monkey")
        
        let answer1 = Option(text: "32")
        let answer2 = Option(text: "81")
        let answer3 = Option(text: "79")
        let answer4 = Option(text: "50")
        let answer5 = Option(text: "41")
        let answer6 = Option(text: "75")
        let answer7 = Option(text: "10")
        let answer8 = Option(text: "60")
        let answer9 = Option(text: "33")
        let answer10 = Option(text: "91")
        let answer11 = Option(text: "52")
        let answer12 = Option(text: "49")
        let answer13 = Option(text: "47")
        let answer14 = Option(text: "72")
        let answer15 = Option(text: "68")

        optionsPartTwo = [cat, dog, elephant, raccoon, rat, giraffe, lion, hedgehog, rabbit, cow, zebra, panda, tiger, owl, penguin, bear, deer, swan, squirrel, monkey, answer1, answer2, answer3, answer4, answer5, answer6, answer7, answer8, answer9, answer10, answer11, answer12, answer13, answer14, answer15]
        
        var questionsPartTwo: [QuestionPartTwo?]
       
        let catQuestion = try? QuestionPartTwo(question: "Please identify the picture of a cat.", correctOption: cat.correctCopy())
        let dogQuestion = try? QuestionPartTwo(question: "Please identify the picture of a dog.", correctOption: dog.correctCopy())
        let raccoonQuestion = try? QuestionPartTwo(question: "Please identify the picture of a raccoon.", correctOption: raccoon.correctCopy())
        let ratQuestion = try? QuestionPartTwo(question: "Please identify the picture of a rat.", correctOption: rat.correctCopy())
        let elephantQuestion = try? QuestionPartTwo(question: "Please identify the picture of a elephant.", correctOption: elephant.correctCopy())
        let giraffeQuestion = try? QuestionPartTwo(question: "Please identify the picture of a giraffe.", correctOption: giraffe.correctCopy())
        let lionQuestion = try? QuestionPartTwo(question: "Please identify the picture of a lion.", correctOption: lion.correctCopy())
        let hedgehogQuestion = try? QuestionPartTwo(question: "Please identify the picture of a hedgehog.", correctOption: hedgehog.correctCopy())
        let rabbitQuestion = try? QuestionPartTwo(question: "Please identify the picture of a rabbit.", correctOption: rabbit.correctCopy())
        let cowQuestion = try? QuestionPartTwo(question: "Please identify the picture of a cow.", correctOption: cow.correctCopy())
        let zebraQuestion = try? QuestionPartTwo(question: "Please identify the picture of a zebra.", correctOption: zebra.correctCopy())
        let pandaQuestion = try? QuestionPartTwo(question: "Please identify the picture of a panda.", correctOption: panda.correctCopy())
        let tigerQuestion = try? QuestionPartTwo(question: "Please identify the picture of a tiger.", correctOption: tiger.correctCopy())
        let owlQuestion = try? QuestionPartTwo(question: "Please identify the picture of a owl.", correctOption: owl.correctCopy())
        let penguinQuestion = try? QuestionPartTwo(question: "Please identify the picture of a penguin.", correctOption: penguin.correctCopy())
        let bearQuestion = try? QuestionPartTwo(question: "Please identify the picture of a bear.", correctOption: bear.correctCopy())
        let deerQuestion = try? QuestionPartTwo(question: "Please identify the picture of a deer.", correctOption: deer.correctCopy())
        let swanQuestion = try? QuestionPartTwo(question: "Please identify the picture of a swan.", correctOption: swan.correctCopy())
        let squirrelQuestion = try? QuestionPartTwo(question: "Please identify the picture of a squirrel.", correctOption: squirrel.correctCopy())
        let monkeyQuestion = try? QuestionPartTwo(question: "Please identify the picture of a monkey.", correctOption: monkey.correctCopy())

        let question1 = try? QuestionPartTwo(question: "What is 46 - 14 ?", correctOption: answer1.correctCopy())
        let question2 = try? QuestionPartTwo(question: "What is 54 + 27 ?", correctOption: answer2.correctCopy())
        let question3 = try? QuestionPartTwo(question: "What is 90 - 11 ?", correctOption: answer3.correctCopy())
        let question4 = try? QuestionPartTwo(question: "What is 28 + 22 ?", correctOption: answer4.correctCopy())
        let question5 = try? QuestionPartTwo(question: "What is 35 + 6 ?", correctOption: answer5.correctCopy())
        let question6 = try? QuestionPartTwo(question: "What is 27 + 48 ?", correctOption: answer6.correctCopy())
        let question7 = try? QuestionPartTwo(question: "What is 87 - 77 ?", correctOption: answer7.correctCopy())
        let question8 = try? QuestionPartTwo(question: "What is 16 + 44 ?", correctOption: answer8.correctCopy())
        let question9 = try? QuestionPartTwo(question: "What is 50 - 17 ?", correctOption: answer9.correctCopy())
        let question10 = try? QuestionPartTwo(question: "What is 65 + 26 ?", correctOption: answer10.correctCopy())
        let question11 = try? QuestionPartTwo(question: "What is 76 - 24 ?", correctOption: answer11.correctCopy())
        let question12 = try? QuestionPartTwo(question: "What is 31 + 18 ?", correctOption: answer12.correctCopy())
        let question13 = try? QuestionPartTwo(question: "What is 81 - 34 ?", correctOption: answer13.correctCopy())
        let question14 = try? QuestionPartTwo(question: "What is 79 - 7 ?", correctOption: answer14.correctCopy())
        let question15 = try? QuestionPartTwo(question: "What is 28 + 40 ?", correctOption: answer15.correctCopy())
        
        questionsPartTwo = [catQuestion, dogQuestion, elephantQuestion, giraffeQuestion, raccoonQuestion, ratQuestion, lionQuestion, hedgehogQuestion, rabbitQuestion, cowQuestion, zebraQuestion, pandaQuestion, tigerQuestion, owlQuestion, penguinQuestion, bearQuestion, deerQuestion, swanQuestion, squirrelQuestion, monkeyQuestion, question1, question2, question3, question4, question5, question6, question7, question8, question9, question10, question11, question12, question13, question14, question15]

        let resultQuestionPartTwo = questionsPartTwo.compactMap { (question) -> QuestionPartTwo? in
            return question
        }
        
        return resultQuestionPartTwo
    }
    
    private func initQuestionsPartThree() -> [String] {
        let question_1 = String.QuestionsPartThree.question1
        let question_2 = String.QuestionsPartThree.question2
        let question_3 = String.QuestionsPartThree.question3
        return [question_1, question_2, question_3]
    }
    
    func getRandomQuestionPartThree() -> String {
        let randomNamber = Int.random(in: 0..<partThree.count)
        return partThree[randomNamber]
    }
    
    func getRandomOptions(totalCount: Int = 3, canUse: (Option) -> Bool) throws -> [Option] {
        var randomOptions: [Option] = []
        
        let maxItCount = 20
        var itCount = 0
        
        var canFits = false
        
        for _ in 0..<totalCount {
            var randomOption: Option!
            repeat {
                itCount += 1
                let randomIndex = Int.random(in: 0..<optionsPartTwo.count)
                randomOption = optionsPartTwo[randomIndex]
                canFits = canUse(randomOption) && !randomOptions.contains(where: {$0 == randomOption})
            } while (!canFits && itCount < maxItCount)
            
            if itCount >= maxItCount {
                throw SystemError.somethingWentWrong
            }
            
            itCount = 0
            randomOptions.append(randomOption)
        }
        return randomOptions
    }
}


