//
//  ClassSelectionScreen.swift
//  GoodVsBad
//
//  Created by Thomas Sesselmann on 23/03/2015.
//  Copyright (c) 2015 ACME Inc. All rights reserved.
//

import UIKit

var villianNavigationController: UINavigationController!

class VillianClassSelectionScreen: UITableViewController {
    
    let classList = ["Gladiator", "Sorcerer", "Thief", "Warlock"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        villianNavigationController = self.navigationController
        
        self.parentViewController?.view.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        
        return classList.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("classNameCell", forIndexPath: indexPath) as! UITableViewCell
        
        // Configure the cell...
        
        let myImageView = cell.contentView.viewWithTag(1) as! UIImageView
        myImageView.image = UIImage(named: classList[indexPath.row])
        
        let myLabel = cell.contentView.viewWithTag(2) as! UILabel
        myLabel.text = classList[indexPath.row]
        
        
        return cell
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showVillianClassInfoScreen" {
            
            (segue.destinationViewController as! VillianClassInfoScreen).className = classList[tableView.indexPathForSelectedRow()!.row]
        }
    }
    
}
