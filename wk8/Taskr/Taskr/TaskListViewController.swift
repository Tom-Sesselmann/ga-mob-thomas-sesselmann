//
//  ViewController.swift
//  Taskr
//
//  Created by Thomas Sesselmann on 14/04/2015.
//  Copyright (c) 2015 Thomas Sesselmann. All rights reserved.
//

import UIKit
import CoreData

class TaskListViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    let coreDataHelper = CoreDataHelper()
    
    var fetchedResultsController : NSFetchedResultsController {
        
        // return the already created NSFetchedResultsController
        // if it has already been created
        // this is to stop the code from running multiple times
        if self._fetchedResultsController != nil {
            return self._fetchedResultsController!
        }
        
        // define the data we would like to retrieve
        let fetchRequest = NSFetchRequest(entityName: "Task")
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        self._fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.coreDataHelper.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
        self._fetchedResultsController?.delegate = self
        self._fetchedResultsController?.performFetch(nil)
        
        return self._fetchedResultsController!
        
    }
    
    var _fetchedResultsController : NSFetchedResultsController?
    
    
    @IBAction func addTask(sender: AnyObject) {
        let task = NSEntityDescription.insertNewObjectForEntityForName("Task", inManagedObjectContext: self.coreDataHelper.managedObjectContext) as! Task
        task.title = "Hello World"
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = self.fetchedResultsController.sections {
            return (sections[section] as! NSFetchedResultsSectionInfo).numberOfObjects
        }
        
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("taskCell") as! UITableViewCell
        
        self.configureCell(cell, atIndexPath: indexPath)
        
        return cell
    }
    
    func configureCell(cell: UITableViewCell, atIndexPath: NSIndexPath) {
        let task = self.fetchedResultsController.objectAtIndexPath(atIndexPath) as! Task
        
        cell.textLabel?.text = task.title
    }
    
    // fetched results controller delegate
    
    /* called first
    begins update to `UITableView`
    ensures all updates are animated simultaneously */
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        self.tableView.beginUpdates()
    }
    
    /* called:
    - when a new model is created
    - when an existing model is updated
    - when an existing model is deleted */
    func controller(controller: NSFetchedResultsController,
        didChangeObject object: AnyObject,
        atIndexPath indexPath: NSIndexPath?,
        forChangeType type: NSFetchedResultsChangeType,
        newIndexPath: NSIndexPath?) {
            switch type {
            case .Insert:
                self.tableView.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: .Automatic)
            case .Update:
                let cell = self.tableView.cellForRowAtIndexPath(indexPath!)
                self.configureCell(cell!, atIndexPath: indexPath!)
                self.tableView.reloadRowsAtIndexPaths([indexPath!], withRowAnimation: .Automatic)
            case .Move:
                self.tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Automatic)
                self.tableView.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: .Automatic)
            case .Delete:
                self.tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Automatic)
            default:
                return
            }
    }
    
    /* called last
    tells `UITableView` updates are complete */
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        self.tableView.endUpdates()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        coreDataHelper.addDummyData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

