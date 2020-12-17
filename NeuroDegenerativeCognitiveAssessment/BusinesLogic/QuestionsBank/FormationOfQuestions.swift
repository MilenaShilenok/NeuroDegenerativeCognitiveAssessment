//
//  FormationOfQuestions.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 07.12.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

class FormationOfQuestions {
    static let instance = FormationOfQuestions()
    
    let optionsName = ["cat", "dog", "elephant", "rat", "raccoon", "giraffe", "lion", "hedgehog", "rabbit", "cow", "zebra", "panda", "tiger", "owl", "penguin", "bear", "deer", "swan", "squirrel", "monkey", "32", "81", "79", "50", "41", "75", "10", "60", "33", "91", "52", "49", "47", "72", "68"]
    var optionsPartTwo: [String: Option] = [:]
    func getOptionsPartTwo() -> [Option] {//[String: Option] {
       // var optionsPartTwo: [String: Option] = [:]
        var options: [Option] = []
        for i in 0..<optionsName.count {
            let option = Option(imageName: optionsName[i])
            options.append(option)
            optionsPartTwo[optionsName[i]] = option
        }
        return options
    }
    
    func a() {
       // var questionsPartTwo: [QuestionPartTwo?]
        let questionsPartTwo: [String:String] = [:]
       // let questionsName = ["Please identify the picture of a cat.", "Please identify the picture of a dog.", "Please identify the picture of a raccoon.", "Please identify the picture of a rat.", "Please identify the picture of a elephant.", "Please identify the picture of a giraffe.", "Please identify the picture of a lion.", "Please identify the picture of a hedgehog.", "Please identify the picture of a rabbit.", "Please identify the picture of a cow.", "Please identify the picture of a zebra.", "Please identify the picture of a panda.", "Please identify the picture of a tiger.", "Please identify the picture of a owl.", "Please identify the picture of a penguin.", "Please identify the picture of a bear.", ]
       //  let catQuestion = try? QuestionPartTwo(question: "Please identify the picture of a cat.", correctOption: optionsPartTwo["cat"]?.correctCopy() ?? <#default value#>)
          /*     let dogQuestion = try? QuestionPartTwo(question: "Please identify the picture of a dog.", correctOption: dog.correctCopy())
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
               
               return resultQuestionPartTwo*/
    }
}
