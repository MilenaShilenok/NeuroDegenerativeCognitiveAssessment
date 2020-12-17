//
//  EditViewIO.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 10.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

protocol EditViewInput: class, UIViewInput {
    func fillProfile(with profile: Profile)
}

protocol EditViewOutput {
    func fillProfile()
    func edit(profile: Profile) throws
}
