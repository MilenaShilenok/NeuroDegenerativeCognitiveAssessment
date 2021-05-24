//
//  PassedTest+CoreDataProperties.swift
//  
//
//  Created by Милена on 23.02.2021.
//
//

import Foundation
import CoreData


extension PassedTest {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PassedTest> {
        return NSFetchRequest<PassedTest>(entityName: "PassedTest")
    }

    @NSManaged public var sessionJsonData: Data?

}
