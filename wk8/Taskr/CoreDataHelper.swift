//
//  CoreDataHelper.swift
//  Taskr
//
//  Created by Thomas Sesselmann on 14/04/2015.
//  Copyright (c) 2015 Thomas Sesselmann. All rights reserved.
//

import UIKit
import CoreData

class CoreDataHelper {
    var managedObjectContext : NSManagedObjectContext {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        return appDelegate.managedObjectContext!
    }
    
    func saveContext() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        return appDelegate.saveContext()
        
    }
    
    func addDummyData() {
        let fetchRequest = NSFetchRequest(entityName: "Task")
        let sortDesciptor = NSSortDescriptor(key: "createdAt", ascending: true)
        fetchRequest.sortDescriptors = [sortDesciptor]
        
    }
}
