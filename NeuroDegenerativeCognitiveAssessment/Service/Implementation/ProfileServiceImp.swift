//
//  UserServiceImp.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 10.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

class ProfileServiceImp: ProfileService {
    
    static let instance = ProfileServiceImp()
    private init() {}
    
    func save(user: User) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: String.Key.savedUser)
        }
    }
    
    // TODO: if "get" -> return
    func getData() -> User? {
        //var user: User
        let defaults = UserDefaults.standard
        if let savedUser = defaults.object(forKey: String.Key.savedUser) as? Data {
            let decoder = JSONDecoder()
            if let loadedUser = try? decoder.decode(User.self, from: savedUser) {
               // user = loadedUser
                return loadedUser
            }
        }
        return nil
       // return user
    }
    
    func remove() {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: String.Key.savedUser)

    }
}
