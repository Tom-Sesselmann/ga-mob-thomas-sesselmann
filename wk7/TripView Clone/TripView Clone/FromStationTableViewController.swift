//
//  FromStationTableViewController.swift
//  TripView Clone
//
//  Created by Thomas Sesselmann on 11/04/2015.
//  Copyright (c) 2015 Thomas Sesselmann. All rights reserved.
//

import UIKit

class FromStationTableViewController: UITableViewController {
    
    let orderedListOfTrainStationsByFirstLetter = getListOfTrainStations()
    
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
        let cell = tableView.dequeueReusableCellWithIdentifier("fromStationCell", forIndexPath: indexPath) as! UITableViewCell
        
        // Configure the cell...
        
        let station = orderedListOfTrainStationsByFirstLetter[indexPath.section][indexPath.row]
        cell.textLabel!.text = "\(station)"
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let firstStationInSection = orderedListOfTrainStationsByFirstLetter[section][0]
        return "\(firstStationInSection[firstStationInSection.startIndex])"
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        let section = tableView.indexPathForSelectedRow()!.section
        let row = tableView.indexPathForSelectedRow()!.row
        
        (segue.destinationViewController as! ToStationTableViewController).fromStation = orderedListOfTrainStationsByFirstLetter[section][row]
        
    }
}
