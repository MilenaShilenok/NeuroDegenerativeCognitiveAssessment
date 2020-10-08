//
//  InputViewIO.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 04.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

protocol EntryViewInput: class {
    func show(error: Error)
}

protocol EntryViewOutput {
    func save(name: String, age: String, email: String)
}
