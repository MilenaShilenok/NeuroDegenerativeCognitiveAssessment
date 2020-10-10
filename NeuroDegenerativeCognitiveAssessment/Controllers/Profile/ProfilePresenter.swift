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
    let service: ProfileService = ProfileServiceImp.instance
    
    init (view: ProfileViewInput) {
        self.view = view
    }
    
    func fillProfile() {
        if let user = service.getData() {
            view.displayProfile(user: user)
        } else {
            
        }
    }
}
