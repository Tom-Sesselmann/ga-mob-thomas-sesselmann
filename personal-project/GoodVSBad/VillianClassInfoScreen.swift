//
//  ClassInfoScreen.swift
//  GoodVsBad
//
//  Created by Thomas Sesselmann on 23/03/2015.
//  Copyright (c) 2015 ACME Inc. All rights reserved.
//

import UIKit

class VillianClassInfoScreen: UITableViewController {
    
    var className : String?
    let stats = ["Health", "Mana", "Strength"]
    let statValues = [100, 80, 10]
    
    @IBOutlet weak var navItem: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navItem.title = className
        // self.tableView.backgroundView = UIImageView(image: UIImage(named: className!))
        
    }
    
    // MARK: - Table view delegate
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        //        println("\(classList[indexPath.row])")
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        if section == 0 { return stats.count }
        else            { return 1 }
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("classStatsCell", forIndexPath: indexPath) as! UITableViewCell
            cell.textLabel!.text = stats[indexPath.row]
            cell.detailTextLabel?.text = "\(statValues[indexPath.row])"
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("classDescriptionCell", forIndexPath: indexPath) as! UITableViewCell
            cell.textLabel!.text = "Description"
            cell.detailTextLabel?.text = "This is a really cool class"
            return cell
            
        }
        
    }
    
}
