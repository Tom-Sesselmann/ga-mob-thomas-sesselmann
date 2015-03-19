//
//  MyTableViewController.swift
//  List of Names
//
//  Created by Thomas Sesselmann on 17/03/2015.
//  Copyright (c) 2015 Thomas Sesselmann. All rights reserved.
//

import UIKit

struct Contact {
    let firstName : String
    let lastName : String
    let email : String?
    let phone : Int?
}

class MyTableViewController: UITableViewController {
    
    var names = [
        "A" : [
            Contact(firstName: "Andy", lastName: "Rush", email: nil, phone: nil),
            Contact(firstName: "Amy", lastName: "Winehouse", email: nil, phone: nil),
            Contact(firstName: "Andrew", lastName: "Mohl", email: nil, phone: nil)],
        "B" : [
            Contact(firstName: "Bob", lastName: "Brown", email: nil, phone: nil),
            Contact(firstName: "Billy", lastName: "Kalaf", email: nil, phone: nil)],
        "C" : [
            Contact(firstName: "Ciara", lastName: "Thomas", email: nil, phone: nil),
            Contact(firstName: "Chris", lastName: "Campbell", email: nil, phone: nil),
            Contact(firstName: "Charlie", lastName: "Brown", email: nil, phone: nil)]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view delegate
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        println("Section: \(indexPath.section); Row:\(indexPath.row);")
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return names.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        let key = names.keys.array.sorted(<)[section]

        return names[key]!.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("titleCell", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...
        
        let key = names.keys.array.sorted(<)[indexPath.section]
        
        let contact = names[key]![indexPath.row]
        cell.textLabel!.text = "\(contact.firstName) \(contact.lastName)"

        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return names.keys.array.sorted(<)[section]
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    func addNewContact(firstName : String, lastName : String, email : String, phone : Int) {
        
        let key = "\(lastName[advance(lastName.startIndex, 0)])".uppercaseString
        
        if self.names[key] == nil {
            self.names[key] = []
        }
        
        self.names[key]!.append(Contact(firstName: firstName, lastName: lastName, email: email, phone: phone))
        
        tableView.reloadData()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showDetailScreen" {
        
            let section = tableView.indexPathForSelectedRow()!.section
            let row = tableView.indexPathForSelectedRow()!.row
            let key = names.keys.array.sorted(<)[section]
            
            (segue.destinationViewController as ViewController).name = names[key]![row].firstName
        }
    }
    
    
    @IBAction func unwindFromAddContactScreen(segue: UIStoryboardSegue) {
        let contact = (segue.sourceViewController as AddContactViewController).renderForm()
        
        self.addNewContact(contact["firstName"]!!, lastName: contact["lastName"]!!, email: contact["email"]!!, phone: contact["phone"]!!.toInt()!)
    }


}
