//
//  Task.swift
//  
//
//  Created by Thomas Sesselmann on 14/04/2015.
//
//

import Foundation
import CoreData

class Task: NSManagedObject {

    @NSManaged var createdAt: NSDate
    @NSManaged var title: String

}
