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
    
    struct InstructionForQuiz {
        static let partOne = "Part 1: Self Efficacy"
        static let instructionPartOne = "The following questions are designed to help us get a better understanding of any symptoms you might be e[periencing in the areas of attention, memory, organization and thinking. Please try to be objective in your answers."
        static let partTwo = "Part 2: Short Answer"
        static let instructionPartTwo = "The following questions are designed to test you using a few simple short-answer questions. Please try to answer these questions quickly and correctly."
        static let partThree = "Part 3: Long Answer"
        static let instructionPartThree = "The following questions are designed to test you using a fw long-answer questions. Please try to provide detailed medium-sized answers. You might find the dectating feature in your keyboard helpful."
    }
    
    struct Status {
        static let notDetermined = "Your cognitive behavior status will appear here after you complete at least 3 questionnaires."
        static let worsenedState = "Potential change detected in cognitive behavior. Please consider visiting your doctor."
    }
    
    struct QuestionsPartThree {
        static let question1 = "Please describe the last movie you watched."
        static let question2 = "Please describe the last birthday party you had."
        static let question3 = "Please describe the last book you read."
    }
    
    static let requiredSymbolForEmail = "@"
}
