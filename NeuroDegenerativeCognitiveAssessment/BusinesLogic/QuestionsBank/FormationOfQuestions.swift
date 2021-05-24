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
    func getOptionsPartTwo() -> [Option] {
        var options: [Option] = []
        for i in 0..<optionsName.count {
            let option = Option(imageName: optionsName[i])
            options.append(option)
            optionsPartTwo[optionsName[i]] = option
        }
        return options
    }
}
