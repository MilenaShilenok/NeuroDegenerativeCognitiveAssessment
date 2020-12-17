//
//  UserService.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 10.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

protocol ProfileService {
    var profile: Profile? { get }
    
    func removeProfile()
    func save(profile: Profile) throws
}
