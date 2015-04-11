//
//  ToolsTableViewController.swift
//  TripView Clone
//
//  Created by Thomas Sesselmann on 11/04/2015.
//  Copyright (c) 2015 Thomas Sesselmann. All rights reserved.
//

import UIKit

class ToolsTableViewController: UITableViewController {
    
    let tools = [
        "Service Information",
        "Maps",
        "Alarm",
        "Settings"
    ]
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        
        return tools.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("toolsCell", forIndexPath: indexPath) as! UITableViewCell
        
        // Configure the cell...
        
        
        let toolName = tools[indexPath.row]
        cell.textLabel!.text = "\(toolName)"
        
        return cell
    }

}
