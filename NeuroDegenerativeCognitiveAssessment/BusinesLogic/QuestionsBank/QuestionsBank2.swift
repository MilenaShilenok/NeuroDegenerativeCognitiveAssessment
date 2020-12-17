//
//  QuestionsBank2.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 17.11.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

class QuestionsBank2 {
    private let bank = QuestionsBank.instance
    
    func ZoptionsPartTwo() -> [Option] {
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

        return [cat, dog, elephant, raccoon, rat, giraffe, lion, hedgehog, rabbit, cow, zebra, panda, tiger, owl, penguin, bear, deer, swan, squirrel, monkey, answer1, answer2, answer3, answer4, answer5, answer6, answer7, answer8, answer9, answer10, answer11, answer12, answer13, answer14, answer15]
    }
    
   /* func zQuestiosPartTwo() -> [QuestionPartTwo] {
        let catQuestion = QuestionPartTwo(question: "Please identify the picture of a cat.", correctOption: cat.correctCopy())
        let dogQuestion = QuestionPartTwo(question: "Please identify the picture of a dog.", correctOption: dog.correctCopy())
        let raccoonQuestion = QuestionPartTwo(question: "Please identify the picture of a raccoon.", correctOption: raccoon.correctCopy())
        let ratQuestion = QuestionPartTwo(question: "Please identify the picture of a rat.", correctOption: rat.correctCopy())
        let elephantQuestion = QuestionPartTwo(question: "Please identify the picture of a elephant.", correctOption: elephant.correctCopy())
        let giraffeQuestion = QuestionPartTwo(question: "Please identify the picture of a giraffe.", correctOption: giraffe.correctCopy())
        let lionQuestion = QuestionPartTwo(question: "Please identify the picture of a lion.", correctOption: lion.correctCopy())
        let hedgehogQuestion = QuestionPartTwo(question: "Please identify the picture of a hedgehog.", correctOption: hedgehog.correctCopy())
        let rabbitQuestion = QuestionPartTwo(question: "Please identify the picture of a rabbit.", correctOption: rabbit.correctCopy())
        let cowQuestion = QuestionPartTwo(question: "Please identify the picture of a cow.", correctOption: cow.correctCopy())
        let zebraQuestion = QuestionPartTwo(question: "Please identify the picture of a zebra.", correctOption: zebra.correctCopy())
        let pandaQuestion = QuestionPartTwo(question: "Please identify the picture of a panda.", correctOption: panda.correctCopy())
        let tigerQuestion = QuestionPartTwo(question: "Please identify the picture of a tiger.", correctOption: tiger.correctCopy())
        let owlQuestion = QuestionPartTwo(question: "Please identify the picture of a owl.", correctOption: owl.correctCopy())
        let penguinQuestion = QuestionPartTwo(question: "Please identify the picture of a penguin.", correctOption: penguin.correctCopy())
        let bearQuestion = QuestionPartTwo(question: "Please identify the picture of a bear.", correctOption: bear.correctCopy())
        let deerQuestion = QuestionPartTwo(question: "Please identify the picture of a deer.", correctOption: deer.correctCopy())
        let swanQuestion = QuestionPartTwo(question: "Please identify the picture of a swan.", correctOption: swan.correctCopy())
        let squirrelQuestion = QuestionPartTwo(question: "Please identify the picture of a squirrel.", correctOption: squirrel.correctCopy())
        let monkeyQuestion = QuestionPartTwo(question: "Please identify the picture of a monkey.", correctOption: monkey.correctCopy())

        let question1 = QuestionPartTwo(question: "What is 46 - 14 ?", correctOption: answer1.correctCopy())
        let question2 = QuestionPartTwo(question: "What is 54 + 27 ?", correctOption: answer2.correctCopy())
        let question3 = QuestionPartTwo(question: "What is 90 - 11 ?", correctOption: answer3.correctCopy())
        let question4 = QuestionPartTwo(question: "What is 28 + 22 ?", correctOption: answer4.correctCopy())
        let question5 = QuestionPartTwo(question: "What is 35 + 6 ?", correctOption: answer5.correctCopy())
        let question6 = QuestionPartTwo(question: "What is 27 + 48 ?", correctOption: answer6.correctCopy())
        let question7 = QuestionPartTwo(question: "What is 87 - 77 ?", correctOption: answer7.correctCopy())
        let question8 = QuestionPartTwo(question: "What is 16 + 44 ?", correctOption: answer8.correctCopy())
        let question9 = QuestionPartTwo(question: "What is 50 - 17 ?", correctOption: answer9.correctCopy())
        let question10 = QuestionPartTwo(question: "What is 65 + 26 ?", correctOption: answer10.correctCopy())
        let question11 = QuestionPartTwo(question: "What is 76 - 24 ?", correctOption: answer11.correctCopy())
        let question12 = QuestionPartTwo(question: "What is 31 + 18 ?", correctOption: answer12.correctCopy())
        let question13 = QuestionPartTwo(question: "What is 81 - 34 ?", correctOption: answer13.correctCopy())
        let question14 = QuestionPartTwo(question: "What is 79 - 7 ?", correctOption: answer14.correctCopy())
        let question15 = QuestionPartTwo(question: "What is 28 + 40 ?", correctOption: answer15.correctCopy())
        
        return [catQuestion, dogQuestion, elephantQuestion, giraffeQuestion, raccoonQuestion, ratQuestion, lionQuestion, hedgehogQuestion, rabbitQuestion, cowQuestion, zebraQuestion, pandaQuestion, tigerQuestion, owlQuestion, penguinQuestion, bearQuestion, deerQuestion, swanQuestion, squirrelQuestion, monkeyQuestion, question1, question2, question3, question4, question5, question6, question7, question8, question9, question10, question11, question12, question13, question14, question15]
    }*/
}
