//
//  InputPresenter.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 04.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

class EntryPresenter: EntryViewOutput {
    
    weak var view:  EntryViewInput!
    
    init(view: EntryViewInput) {
        self.view = view
    }
    
    func isValid(name: String, age: String, email: String) -> Bool {
        if name.isEmpty || age.isEmpty || email.isEmpty {
            return false
        } else {
            return true
        }
    }
    
    func save(name: String, age: String, email: String) {
        if !isValid(name: name, age: age, email: email) {
            view.show(error: SystemError.emptyFields)
            return
        }
    }
    
}
