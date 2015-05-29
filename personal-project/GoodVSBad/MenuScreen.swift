//
//  MenuScreen.swift
//  GoodVSBad
//
//  Created by Thomas Sesselmann on 29/05/2015.
//  Copyright (c) 2015 ACME Inc. All rights reserved.
//

import UIKit
import CoreData

var currentGame: Game!
var appDelegate: AppDelegate?

class MenuScreen: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func newGame(sender: AnyObject) {
        
        currentGame = NSEntityDescription.insertNewObjectForEntityForName("Game", inManagedObjectContext: appDelegate!.managedObjectContext!) as! Game
        currentGame.createdAt = NSDate()
        appDelegate?.saveContext()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
