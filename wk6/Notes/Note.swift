//
//  Note.swift
//  
//
//  Created by Thomas Sesselmann on 9/04/2015.
//
//

import Foundation
import CoreData

@objc(Note)

class Note: NSManagedObject {

    @NSManaged var text: String
    @NSManaged var title: String
    @NSManaged var createdAt: NSDate

}
