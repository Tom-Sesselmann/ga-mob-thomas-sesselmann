//
//  NewTripTableViewController.swift
//  TripView Clone
//
//  Created by Thomas Sesselmann on 11/04/2015.
//  Copyright (c) 2015 Thomas Sesselmann. All rights reserved.
//

import UIKit

class NewTripTableViewController: UITableViewController {
    
    let tripTypes = [
        ["Sydney Trains"     , "By Station"],
        ["Sydney Buses"      , "By Route", "By Suburb", "By Stop"],
        ["Sydney Ferries"    , "By Wharf"],
        ["Sydney Light Rail" , "By Stop"]
    ]
    
    // MARK: - Table view delegate
    
//    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
//        println("Section: \(indexPath.section); Row:\(indexPath.row);")
//    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return tripTypes.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        
        return tripTypes[section].count - 1
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tripTypeCell", forIndexPath: indexPath) as! UITableViewCell
        
        // Configure the cell...
        
        let tripType = tripTypes[indexPath.section][indexPath.row + 1]
        cell.textLabel!.text = "\(tripType)"
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tripTypes[section][0]
    }

}
