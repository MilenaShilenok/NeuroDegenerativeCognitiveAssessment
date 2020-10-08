//
//  User.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 04.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation
import CoreData

struct User {
    let name: String
    let age: Int
    let email: String
    
   /* var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "SavingLearn")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    var context: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    
    var user = User(context: context)
    user.age = 32
    
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
              context.rollback()
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }*/
}
