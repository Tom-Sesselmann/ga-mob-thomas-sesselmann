//
//  ToStationTableViewController.swift
//  TripView Clone
//
//  Created by Thomas Sesselmann on 14/04/2015.
//  Copyright (c) 2015 Thomas Sesselmann. All rights reserved.
//

import UIKit
import CoreData

class ToStationTableViewController: UITableViewController {
    
    var appDelegate: AppDelegate?
    
    var fromStation : String?
    var toStation : String?
    let orderedListOfTrainStationsByFirstLetter = getListOfTrainStations()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.appDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
    }
    
    // MARK: - Table view delegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        toStation = orderedListOfTrainStationsByFirstLetter[indexPath.section][indexPath.row]
        
        let trip = NSEntityDescription.insertNewObjectForEntityForName("Trip", inManagedObjectContext: appDelegate!.managedObjectContext!) as! Trip
        trip.fromLocation = fromStation!
        trip.toLocation = toStation!
        trip.subtitle = ""
        
        appDelegate?.saveContext()
        
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return orderedListOfTrainStationsByFirstLetter.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        
        return orderedListOfTrainStationsByFirstLetter[section].count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("toStationCell", forIndexPath: indexPath) as! UITableViewCell
        
        // Configure the cell...
        
        let station = orderedListOfTrainStationsByFirstLetter[indexPath.section][indexPath.row]
        cell.textLabel!.text = "\(station)"
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let firstStationInSection = orderedListOfTrainStationsByFirstLetter[section][0]
        return "\(firstStationInSection[firstStationInSection.startIndex])"
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        let section = tableView.indexPathForSelectedRow()!.section
//        let row = tableView.indexPathForSelectedRow()!.row
//        
//        toStation = orderedListOfTrainStationsByFirstLetter[section][row]
//    }
}
