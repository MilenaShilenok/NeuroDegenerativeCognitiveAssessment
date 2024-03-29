//
//  ProfileViewIO.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 07.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

protocol ProfileViewInput: class, UIViewInput {
    func displayProfile(profile: Profile)
}

protocol ProfileViewOutput {
    func fillProfile()
    func deleteProfile()
}
