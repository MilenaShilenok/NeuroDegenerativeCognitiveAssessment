//
//  UserService.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 10.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

protocol ProfileService {
    func removeProfile()
    func save(profile: Profile) throws
    var profile: Profile? { get }
}
