//
//  Task.swift
//  Taskr
//
//  Created by Thomas Sesselmann on 14/04/2015.
//  Copyright (c) 2015 Thomas Sesselmann. All rights reserved.
//

import Foundation
import CoreData

class Task: NSManagedObject {

    @NSManaged var createdAt: NSDate
    @NSManaged var title: String

}
