//
//  InputPresenter.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 04.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

class EntryPresenter: EntryViewOutput {
    
    weak var view: EntryViewInput!
    let service: ProfileService = ProfileServiceImp.instance
    
    init(view: EntryViewInput) {
        self.view = view
    }
    
    func check(user: User) -> Bool {
        if user.name.isEmpty || user.email.isEmpty || user.age.description.isEmpty {
            view.show(error: SystemError.emptyFields)
            return false
        }
        return true
    }
    
    func save(user: User) {
        if !check(user: user) {
            return
        }
        service.save(user: user)
        /*let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: String.Key.savedUser)
        }*/
    }
    
}
