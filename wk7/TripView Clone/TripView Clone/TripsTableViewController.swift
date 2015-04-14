//
//  TripsTableViewController.swift
//  TripView Clone
//
//  Created by Thomas Sesselmann on 11/04/2015.
//  Copyright (c) 2015 Thomas Sesselmann. All rights reserved.
//

import UIKit

class TripsTableViewController: UITableViewController {
    
    struct Trip {
        let fromLocation : String
        let toLocation : String
        let subtitle : String
    }
    
    var tripData : [Trip] = [
        Trip(fromLocation: "Lewisham", toLocation: "Artarmon", subtitle: "Via Central"),
        Trip(fromLocation: "Central", toLocation: "Lewisham", subtitle: "Automatic Routing"),
        Trip(fromLocation: "Central", toLocation: "Artarmon", subtitle: "Automatic Routing"),
        Trip(fromLocation: "Lane Cove", toLocation: "City", subtitle: "Routes 251, 252, 253, 254, 261, 285, 286, 288, 290"),
        Trip(fromLocation: "City", toLocation: "Lane Cove", subtitle: "Routes 251, 252, 253, 254, 261, 285, 286, 288, 290"),
        Trip(fromLocation: "Chatswood", toLocation: "Artarmon", subtitle: "143, 144, 200"),
    ]
    
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        
        return tripData.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tripCell", forIndexPath: indexPath) as! UITableViewCell
        
        // Configure the cell...
        
        
        let trip = tripData[indexPath.row]
        cell.textLabel!.text = "\(trip.fromLocation) to \(trip.toLocation)"
        cell.detailTextLabel?.text = "\(trip.subtitle)"
        
        return cell
    }
    
    
    @IBAction func unwindFromToStationScreen(segue: UIStoryboardSegue) {
        let fromStation = (segue.sourceViewController as! ToStationTableViewController).fromStation!
        let toStation = (segue.sourceViewController as! ToStationTableViewController).toStation!
        
        tripData += [Trip(fromLocation: fromStation, toLocation: toStation, subtitle: "")]
        
        tableView.reloadData()
    }

}
