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

    let profileService: ProfileService = ProfileServiceImp.instance
    
    init(view: EntryViewInput) {
        self.view = view
    }
    
    func save(profile: Profile) {
        do {
            try profile.validate()
            try profileService.save(profile: profile)
            view.openModule()
        } catch {
            view.show(error: error, handler: nil)
        }
    }
}
