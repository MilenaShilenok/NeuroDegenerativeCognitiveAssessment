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
        static let error = "Error"
        static let ok = "ok"
    }
    
    struct Warning {
        static let wantToErseData = "Are you sure you want to erase your data in this app?"
        static let cancel = "Cancel"
        static let erase = "Erase"
        static let warning = "Warning"
    }
    
    struct Color {
        static let color = "Color"
        static let green = "Green"
    }
    
    struct Storyboard {
        static let main = "Main"
        static let profile = "Profile"
        static let home = "Home"
        static let fillingProfile = "FillingProfile"
    }
    
    struct QuestionsPart1 {
        static let question1 = "1. I am sure that I can recognize when I forget something"
        static let question2 = "2. I am sure that I can recognize when I become distracted"
        static let question3 = "3. I am sure that I can recognize when I am having difficulty concentrating"
        static let question4 = "4. I am sure that I can recognize when I make a mistake"
        static let question5 = "5. I am sure that I can recognize when I have missed details or information"
        static let question6 = "6. I am sure that I can recognize when my mind feels cloudy or less sharp"
        static let question7 = "7. I am sure that I can recognize when there is too much information for me to process"
        static let question8 = "8. I am sure that I can recognize when I have lost track of what I was just doing"
    }
    
    static let isAuthorized = "isAuthorized"
    static let savedUser = "savedUser"
    static let requiredSymbolForEmail = "@"
}
