//
//  EntryServiceImp.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 09.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

// TODO: Profile
class UserServiceImp: UserService {
    
    static let instance = UserServiceImp()
    private init() {}
    
    func save(user: User) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: String.Key.savedUser)
        }
    }
    
    // TODO: if "get" -> return
    func getData() {
        let defaults = UserDefaults.standard
        if let savedUser = defaults.object(forKey: String.Key.savedUser) as? Data {
            let decoder = JSONDecoder()
            if let loadedUser = try? decoder.decode(User.self, from: savedUser) {
                //print(loadedUser)
                //return loadedUser
            }
        }
    }
    
    func remove() {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: String.Key.savedUser)

    }
}
