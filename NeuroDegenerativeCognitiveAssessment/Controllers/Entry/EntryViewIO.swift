//
//  InputViewIO.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 04.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

protocol EntryViewInput: class, UIViewInput {
    
}

protocol EntryViewOutput {
    func save(profile: Profile)
}
