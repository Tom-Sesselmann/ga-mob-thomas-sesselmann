//
//  TripsTableViewController.swift
//  TripView Clone
//
//  Created by Thomas Sesselmann on 11/04/2015.
//  Copyright (c) 2015 Thomas Sesselmann. All rights reserved.
//

import UIKit
import CoreData

class TripsTableViewController: UITableViewController {
    
    var appDelegate: AppDelegate?
    
    struct PlaceholderTrip {
        let fromLocation : String
        let toLocation : String
        let subtitle : String
    }
    
    var initialTripData : [PlaceholderTrip] = [
        PlaceholderTrip(fromLocation: "Lewisham", toLocation: "Artarmon", subtitle: "Via Central"),
        PlaceholderTrip(fromLocation: "Central", toLocation: "Lewisham", subtitle: "Automatic Routing"),
        PlaceholderTrip(fromLocation: "Central", toLocation: "Artarmon", subtitle: "Automatic Routing"),
        PlaceholderTrip(fromLocation: "Lane Cove", toLocation: "City", subtitle: "Routes 251, 252, 253, 254, 261, 285, 286, 288, 290"),
        PlaceholderTrip(fromLocation: "City", toLocation: "Lane Cove", subtitle: "Routes 251, 252, 253, 254, 261, 285, 286, 288, 290"),
        PlaceholderTrip(fromLocation: "Chatswood", toLocation: "Artarmon", subtitle: "143, 144, 200"),
    ]
    
    override func viewWillAppear(animated: Bool) {
        
        self.tableView.reloadData()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        
        if let trips = fetchTrips() {
            return trips.count + initialTripData.count
        }
        else { return initialTripData.count }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tripCell", forIndexPath: indexPath) as! UITableViewCell
        
        // Configure the cell...
        
        
        if indexPath.row < initialTripData.count {
            let trip = initialTripData[indexPath.row]
            cell.textLabel!.text = "\(trip.fromLocation) to \(trip.toLocation)"
            cell.detailTextLabel?.text = "\(trip.subtitle)"
        }
        else {
            if let trips = fetchTrips() {
                let trip = trips[indexPath.row - initialTripData.count]
                cell.textLabel!.text = "\(trip.fromLocation) to \(trip.toLocation)"
                cell.detailTextLabel?.text = "\(trip.subtitle)"
            }
        }
        
        return cell
    }
    
    
    func fetchTrips() -> [Trip]? {
        let tripsFetchRequest = NSFetchRequest(entityName: "Trip")
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: false)
        tripsFetchRequest.sortDescriptors = [sortDescriptor]
        
        if let trips = appDelegate!.managedObjectContext!.executeFetchRequest(tripsFetchRequest, error: nil) as? [Trip] {
            return trips
        }
        else { return nil }
    }
    
    
//    @IBAction func unwindFromToStationScreen(segue: UIStoryboardSegue) {
//        let fromStation = (segue.sourceViewController as! ToStationTableViewController).fromStation!
//        let toStation = (segue.sourceViewController as! ToStationTableViewController).toStation!
//        
//        initialTripData += [PlaceholderTrip(fromLocation: fromStation, toLocation: toStation, subtitle: "")]
//        
//        tableView.reloadData()
//    }

}
