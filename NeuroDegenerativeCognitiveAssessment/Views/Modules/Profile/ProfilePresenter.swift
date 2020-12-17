//
//  ProfilePresenter.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 07.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

class ProfilePresenter: ProfileViewOutput {
    
    weak var view: ProfileViewInput!
    let bank = QuestionsBank.instance
    
    let profileService: ProfileService = ProfileServiceImp.instance
    
    init (view: ProfileViewInput) {
        self.view = view
    }
    
    func fillProfile() {
        if let profile = profileService.profile {
            view.displayProfile(profile: profile)
        } else {
            view.show(error: SystemError.profileNotFound) 
        }
    }
    
    func deleteProfile() {
        profileService.removeProfile()
    }
    
}
