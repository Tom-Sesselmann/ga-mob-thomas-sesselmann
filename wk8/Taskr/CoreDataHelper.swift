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
        
        // read out the data
        let fetchRequest = NSFetchRequest(entityName: "Task")
        let sortDesciptor = NSSortDescriptor(key: "createdAt", ascending: true)
        fetchRequest.sortDescriptors = [sortDesciptor]
        
        let tasks = self.managedObjectContext.executeFetchRequest(fetchRequest, error: nil) as! [Task]
        
        // loop the data and delete it
        for task in tasks {
            self.managedObjectContext.deleteObject(task)
        }
        
        // the content
        let taskStrings = [
            "Do the dishes",
            "Hang out the washing",
            "Fold clothes",
            "Master Swift"
        ]
        
        // creating the content
        for taskString in taskStrings {
            let newTask = NSEntityDescription.insertNewObjectForEntityForName("Task", inManagedObjectContext: self.managedObjectContext) as! Task
            
            newTask.title = taskString
        }
        
        // saving the content to disk
        self.saveContext()
    }
}
