//
//  ClassSelectionScreen.swift
//  GoodVsBad
//
//  Created by Thomas Sesselmann on 23/03/2015.
//  Copyright (c) 2015 ACME Inc. All rights reserved.
//

import UIKit

class ClassSelectionScreen: UITableViewController {

    let classList = ["Warrior", "Mage", "Rogue", "Priest"]
    

    // MARK: - Table view delegate
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        println("\(classList[indexPath.row])")
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        
        return classList.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("classNameCell", forIndexPath: indexPath) as UITableViewCell
        
        // Configure the cell...
        
        
        cell.textLabel!.text = classList[indexPath.row]
        cell.imageView!.image = UIImage(named: classList[indexPath.row])
        
        return cell
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showClassInfoScreen" {
            
            (segue.destinationViewController as ClassInfoScreen).className = classList[tableView.indexPathForSelectedRow()!.row]
        }
    }
    
}
