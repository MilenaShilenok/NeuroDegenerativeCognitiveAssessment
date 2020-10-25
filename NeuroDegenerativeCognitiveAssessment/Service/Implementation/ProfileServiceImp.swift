//
//  UserServiceImp.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 10.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation

class ProfileServiceImp: ProfileService {
    

    private let defaults = UserDefaults.standard
    
    var profile: Profile?

    var hasProfile: Bool {
        return profile != nil
    }
    
    static let instance = ProfileServiceImp()
    
    private init() {
        do {
            profile = try getProfile()
        } catch {
            assertionFailure(error.localizedDescription)
        }
    }

    func save(profile: Profile) throws {
        let encoder = JSONEncoder()
        let encoded = try encoder.encode(profile)
        defaults.set(encoded, forKey: UserDefaults.Key.savedUser)
        self.profile = profile
    }
    
    private func getProfile() throws -> Profile? {
        guard let savedUser = defaults.object(forKey: UserDefaults.Key.savedUser) as? Data else {
            return nil
        }

        let decoder = JSONDecoder()
        let loadedUser = try decoder.decode(Profile.self, from: savedUser)
        
        profile = loadedUser
        return loadedUser
    }
    
    func removeProfile() {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: UserDefaults.Key.savedUser)
        profile = nil
    }

}
