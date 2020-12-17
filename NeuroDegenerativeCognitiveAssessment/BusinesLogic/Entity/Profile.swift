//
//  User.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 04.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation
import CoreData

struct Profile: Codable {
    let name: String
    let age: Int
    let email: String
    
    func validate() throws {
        let minSizeForName = 3
        let minAge = 5
        let maxAge = 100
        if self.name.isEmpty || self.email.isEmpty || self.age.description.isEmpty {
           throw ValidationError.emptyFields
        }
        if self.name.count < minSizeForName {
            throw ValidationError.shortName
        }
        if self.age < minAge || self.age > maxAge {
            throw ValidationError.wrongAge
        }
        if !self.email.contains(String.requiredSymbolForEmail) {
            throw ValidationError.wrongEmail
        }
    }
}
