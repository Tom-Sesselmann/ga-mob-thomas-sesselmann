//
//  MenuScreen.swift
//  GoodVSBad
//
//  Created by Thomas Sesselmann on 29/05/2015.
//  Copyright (c) 2015 ACME Inc. All rights reserved.
//

import UIKit
import CoreData
import GameKit

var currentGame: Game!
var appDelegate: AppDelegate?

var gameCenterEnabled: Bool = false
var leaderboardIdentifier: String?

class MenuScreen: UIViewController {
    
    @IBOutlet weak var startGameButton: UIButton!    

    override func viewDidLoad() {
        super.viewDidLoad()
        authenticateLocalPlayer()
        
        appDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        
        
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.CurveLinear, animations: {
            self.startGameButton.center = CGPoint(x: self.startGameButton.center.x, y: self.startGameButton.center.y + self.view.bounds.height/2)
            
            }, completion: nil)
    }
    
    @IBAction func newGame(sender: AnyObject) {
        
        currentGame = NSEntityDescription.insertNewObjectForEntityForName("Game", inManagedObjectContext: appDelegate!.managedObjectContext!) as! Game
        currentGame.createdAt = NSDate()
        appDelegate?.saveContext()
        performSegueWithIdentifier("showSplitScreen", sender: self)
    }
    
    
    // GAME CENTER
    func authenticateLocalPlayer() {
        var localPlayer = GKLocalPlayer()
        localPlayer.authenticateHandler = {(viewController : UIViewController!, error : NSError!) -> Void in
            if viewController != nil {
                self.presentViewController(viewController, animated: true, completion: nil)
            } else {
                if localPlayer.authenticated {
                    gameCenterEnabled = true
                    
                    localPlayer.loadDefaultLeaderboardIdentifierWithCompletionHandler({ (leaderboardIdentifierInput : String!, error : NSError!) -> Void in
                        if error != nil {
                            println(error.localizedDescription)
                        } else {
                            leaderboardIdentifier = leaderboardIdentifierInput
                        }
                    })
                    
                } else {
                    gameCenterEnabled = false
                }
            }
        }
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
