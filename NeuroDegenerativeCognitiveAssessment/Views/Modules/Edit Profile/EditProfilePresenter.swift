//
//  EditProfilePresenter.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 10.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

class EditProfilePresenter: EditViewOutput {
    
    let profileService: ProfileService = ProfileServiceImp.instance
    weak var view: EditViewInput!
    
    init (view: EditViewInput) {
        self.view = view
    }
    
    func fillProfile() {
        if let profile = profileService.profile {
            view.fillProfile(with: profile)
        } else {
            view.show(error: SystemError.profileNotFound)
        }
    }
    
    func edit(profile: Profile) throws {
        do {
            try profile.validate()
            try profileService.save(profile: profile)
        } catch {
            throw error
        }
    }
}
