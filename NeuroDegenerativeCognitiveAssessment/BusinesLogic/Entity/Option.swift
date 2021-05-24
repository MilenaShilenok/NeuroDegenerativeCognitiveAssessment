//
//  Option.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 20.11.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

struct Option: Codable {
    enum OptionType: Int, Codable {
        case text = 0
        case image = 1
    }
    
    let value: String
    
    let type: OptionType
    var isCorrect: Bool = false
    
    init(text: String) {
        value = text
        type = .text
    }
    
    init(imageName: String) {
        value = imageName
        type = .image
    }
    
    /// Get copy of instance and mark it as correct
    func correctCopy() -> Option {
        var copy = self
        copy.isCorrect = true
        return copy
    }
}

extension Option: Equatable {
    static func ==(lhs: Option, rhs: Option) -> Bool {
        return lhs.value == rhs.value
    }
}
