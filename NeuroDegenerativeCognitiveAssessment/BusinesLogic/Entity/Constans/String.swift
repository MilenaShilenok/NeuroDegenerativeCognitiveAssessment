//
//  String.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 09.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

extension String {
    struct Error {
        static let fillAllFields = "Fill in all the fields"
        static let somethingWentWrong = "Something went wrong. Try later again"
        static let shortName = "The name is too short"
        static let wrongEmail = "Email entered incorrectly"
        static let wrongAge = "Age entered incorrectly"
        static let profileNotFound = "Profile is not found. Please login again"
        static let questionsIsEmpty = "Error. Questions part two is empty"
        static let shortAnswer = "Please make your answer a bit longer. It is very hard for us to analyze your cognitive state if you provide a short answer!"
        static let error = "Error"
        static let ok = "ok"
        static let color = "Color"
        static let averageScoreNotFound = "Average score not found"
        static let indexOutOfRange = "Index out of range"
        static let historyUnavailable = "History is temporarily unavailable. Please try again later"
        static let failedFetchPassedTests = "Failed fetch passed tests"
        static let encodingError = "Encoding error"
        static let noAccessToAppDelegate = "No access to AppDelegate"
        static let failedToDeleteHistory = "Failed to delete history"
        static let failedToCreateFile = "Failed to create file"
        static let optionNotSelected = "Option not selected"
    }
    
    struct Warning {
        static let wantToErseData = "Are you sure you want to erase your data in this app?"
        static let cancel = "Cancel"
        static let erase = "Erase"
        static let warning = "Warning"
    }
    
    struct QuestionsPartOne {
        static let question1 = "1. I am sure that I can recognize when I forget something"
        static let question2 = "2. I am sure that I can recognize when I become distracted"
        static let question3 = "3. I am sure that I can recognize when I am having difficulty concentrating"
        static let question4 = "4. I am sure that I can recognize when I make a mistake"
        static let question5 = "5. I am sure that I can recognize when I have missed details or information"
        static let question6 = "6. I am sure that I can recognize when my mind feels cloudy or less sharp"
        static let question7 = "7. I am sure that I can recognize when there is too much information for me to process"
        static let question8 = "8. I am sure that I can recognize when I have lost track of what I was just doing"
    }
    
    struct QuestionsPartTwo {
        static let catQuestion = "Please identify the picture of a cat."
        static let dogQuestion = "Please identify the picture of a dog."
        static let raccoonQuestion = "Please identify the picture of a raccoon."
        static let ratQuestion = "Please identify the picture of a rat."
        static let elephantQuestion = "Please identify the picture of a elephant."
        static let giraffeQuestion = "Please identify the picture of a giraffe."
        static let lionQuestion = "Please identify the picture of a lion."
        static let hedgehogQuestion = "Please identify the picture of a hedgehog."
        static let rabbitQuestion = "Please identify the picture of a rabbit."
        static let cowQuestion = "Please identify the picture of a cow."
        static let zebraQuestion = "Please identify the picture of a zebra."
        static let pandaQuestion = "Please identify the picture of a panda."
        static let tigerQuestion = "Please identify the picture of a tiger."
        static let owlQuestion = "Please identify the picture of a owl."
        static let penguinQuestion = "Please identify the picture of a penguin."
        static let bearQuestion = "Please identify the picture of a bear."
        static let deerQuestion = "Please identify the picture of a deer."
        static let swanQuestion = "Please identify the picture of a swan."
        static let squirrelQuestion = "Please identify the picture of a squirrel."
        static let monkeyQuestion = "Please identify the picture of a monkey."
    }
    
    struct InstructionForQuiz {
        static let instructionPartOne = "The following questions are designed to help us get a better understanding of any symptoms you might be e[periencing in the areas of attention, memory, organization and thinking. Please try to be objective in your answers."
        static let instructionPartTwo = "The following questions are designed to test you using a few simple short-answer questions. Please try to answer these questions quickly and correctly."
        static let instructionPartThree = "The following questions are designed to test you using a fw long-answer questions. Please try to provide detailed medium-sized answers. You might find the dectating feature in your keyboard helpful."
    }
    
    struct Status {
        static let notDetermined = "Your cognitive behavior status will appear here after you complete at least 3 questionnaires."
        static let negativeState = "Potential change detected in cognitive behavior. Please consider visiting your doctor."
        static let positiveStatus = "No changes in cognitive behavior were found"
    }
    
    struct PartsName {
        static let partOne = "Part 1: Self Efficacy"
        static let partTwo = "Part 2: Short Answer"
        static let partThree = "Part 3: Long Answer"
    }
    
    struct QuestionsPartThree {
        static let question1 = "Please describe the last movie you watched."
        static let question2 = "Please describe the last birthday party you had."
        static let question3 = "Please describe the last book you read."
    }
    
    struct ButtonStatus {
        static let beginQuiz = "Begin Questionnaire"
        static let continueQuiz = "Continue"
        static let daysUntilNextSession = "DAYS UNTILL NEXT SESSION"
        static let hoursUntilNextSession = "HOURS UNTILL NEXT SESSION"
        static let minutesUntilNextSession = "MINUTES UNTILL NEXT SESSION"
    }
    
    struct History {
        static let correct = "Correct"
        static let incorrect = "Incorrect"
        static let responsesTime = "Response time: "
        static let sec = "s"
        static let yourAnswer = "Your answer: "
        static let noHistory = "You have no history yet. You can view your history once you have answered at least one questionnaire!"
        static let gunningFog = "Gunning Fog index: "
    }
    
    struct Export {
        static let noQuestionnaireResults = "You have no questionnaire results yet. You can export the results when you answer at least one questionnaire!"
        static let export = "EXPORT"
        static let exportDescription = "The export feature allows you to download your questionnaire results in a .csv file. The file includes detailed information as well as scores for all your questionnaire sessions, which you might want to share with your doctor, family or friends."
    }
    
    struct Information {
        static let question1 = "How does the app work?"
        static let answer1 = "The user is asked to take a test consisting of three stages. The test can be taken no more than once every 2 weeks. The results of each test are evaluated on a one-hundred-point scale. The application does not care about the specific score that the user earned for a particular test, only the dynamics of changes in the number of points is important. Thus, if the user has passed 5 tests and each of the tests shows a worse result than the previous one, application can conclude that the user's disease is progressing and it is advisable to consult a doctor."
        static let question2 = "How are the scores calculated?"
        static let answer2 = "The test consists of 3 stages. During the first stage, the user evaluates himself. During the second stage, the application evaluates the correctness of the response and the speed of the reaction. During the third stage, the application calculates the number of points based on the gunning fog value, using a special formula."
        static let question3 = "How much can I trust the app?"
        static let answer3 = "The app evaluates only subjective results and cannot replace a doctor's consultation. The application is designed only to measure the dynamics of changes in the user's state."
        static let question4 = "How do I save the results?"
        static let answer4 = "For your convenience, a special functionality has been implemented that converts all your data to cvs format and offers to export it in a convenient way (send it to email, social networks or messengers, save it in files)"
        
        static let date = "Date"
        static let averageScore = "Average score"
        static let partOne = "Part 1"
        static let partTwo = "Part 2"
        static let partThree = "Part 3"
        static let averageTime = "Average time"
        static let correctAnswers = "Correct answers"
        static let questionPartThree = "Question Part 3"
        static let answerPartThree = "Answer Part 3"
        static let gunningFog = "Gunning Fog"
    }
    
    static let requiredSymbolForEmail = "@"
    static let fileName = "Passed tests"
}
