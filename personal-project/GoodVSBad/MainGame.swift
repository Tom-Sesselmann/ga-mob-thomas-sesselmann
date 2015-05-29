//
//  MainGame.swift
//  GoodVSBad
//
//  Created by Jack Watson-Hamblin on 12/03/2015.
//  Copyright (c) 2015 ACME Inc. All rights reserved.
//

import UIKit
import CoreData
import GameKit

class MainGame: UIViewController {
    
    @IBOutlet weak var heroHealthBarWidth: NSLayoutConstraint!
    @IBOutlet weak var heroHealthBarCnt: HealthBar!
    @IBOutlet weak var heroLabel: UILabel!
    @IBOutlet weak var villianHealthBarWidth: NSLayoutConstraint!
    @IBOutlet weak var villianHealthBarCnt: UIView!
    @IBOutlet weak var villianLabel: UILabel!
    
    
    let superHero = SuperHero(name: currentGame.heroClass!)
    let superVillain = SuperVillain(name: currentGame.villianClass!)

    override func viewDidLoad() {
        super.viewDidLoad()
//        modalTransitionStyle = UIModalTransitionStyle.CoverVertical
        heroLabel.text = superHero.name
        villianLabel.text = superVillain.name
        villianLabel.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
    }

    @IBAction func superHeroAttack(sender: AnyObject) {
        
        println("Super Hero Attacks")
        let damageValue = superHero.attack(superVillain)
        
        // Make Damage Label
        var damageLabel = UILabel(frame: CGRectMake(0, 0, 200, 30))
        let x = arc4random_uniform(UInt32(self.view.frame.width) - 50) + 25
        let y = arc4random_uniform(UInt32(self.view.frame.height/2) - 150) + 150
        damageLabel.center = CGPointMake(CGFloat(x), CGFloat(y))
        damageLabel.textAlignment = NSTextAlignment.Center
        damageLabel.font = UIFont(name: damageLabel.font.fontName, size: CGFloat(damageValue/2+20))
        if damageValue == 0 {
            damageLabel.text = "BLOCKED"
            damageLabel.textColor = UIColor.whiteColor()
        } else {
            damageLabel.text = "-\(damageValue)"
            damageLabel.textColor = UIColor.redColor()
        }
//        damageLabel.shadowColor = UIColor.blackColor()
        damageLabel.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
        self.view.addSubview(damageLabel)
        
        
        // Animate Health Bar and Damage Label
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.CurveLinear, animations: {
            damageLabel.alpha = 0
            damageLabel.center = CGPointMake(CGFloat(x), CGFloat(y - 50))
            self.villianHealthBarWidth.constant = -(self.villianHealthBarCnt.frame.width + 4 - CGFloat(self.superVillain.health / self.superVillain.maxHealth) * self.villianHealthBarCnt.frame.width)
            self.view.layoutIfNeeded()
            
            }, completion: nil)
        
        
        checkGameOver(superVillain)
    }
    
    @IBAction func superVillainAttack(sender: AnyObject) {
        println("Super Villain Attacks")
        
        let damageValue = superVillain.attack(superHero)
        
        // Make Damage Label
        var damageLabel = UILabel(frame: CGRectMake(0, 0, 200, 30))
        let x = arc4random_uniform(UInt32(self.view.frame.width) - 50) + 25
        let y = arc4random_uniform(UInt32(self.view.frame.height/2) - 150) + UInt32(self.view.frame.height/2)
        damageLabel.center = CGPointMake(CGFloat(x), CGFloat(y))
        damageLabel.textAlignment = NSTextAlignment.Center
        damageLabel.font = UIFont(name: damageLabel.font.fontName, size: CGFloat(damageValue/2+20))
        damageLabel.text = "-\(damageValue)"
        if damageValue == 0 {
            damageLabel.text = "BLOCKED"
            damageLabel.textColor = UIColor.whiteColor()
        } else {
            damageLabel.text = "-\(damageValue)"
            damageLabel.textColor = UIColor.redColor()
        }
//        damageLabel.shadowColor = UIColor.blackColor()
        self.view.addSubview(damageLabel)
        
        // Animate Health Bar and Damage Label
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.CurveLinear, animations: {
            damageLabel.alpha = 0
            damageLabel.center = CGPointMake(CGFloat(x), CGFloat(y + 50))
            self.heroHealthBarWidth.constant = self.heroHealthBarCnt.frame.width + 4 - CGFloat(self.superHero.health / self.superHero.maxHealth) * self.heroHealthBarCnt.frame.width
            self.view.layoutIfNeeded()
            
            }, completion: nil)
        
        checkGameOver(superHero)
    }
    
    
    func checkGameOver(player : Player) {
        if player.health <= 0 {
            
            // Save results
            currentGame.winner = player.name
            appDelegate?.saveContext()
            
            // Report Score to Game Center
            if gameCenterEnabled {
                let score = GKScore(leaderboardIdentifier: leaderboardIdentifier)
                score.value = Int64(arc4random_uniform(1000))
                GKScore.reportScores([score], withCompletionHandler: nil)
            }
            
            
            // Create PopUp
            var alert = UIAlertController(title: "Game Over!", message: "\(player.name) is DEAD", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "New Game", style: UIAlertActionStyle.Default) { alert in
                
                // Create New Game Model
                currentGame = NSEntityDescription.insertNewObjectForEntityForName("Game", inManagedObjectContext: appDelegate!.managedObjectContext!) as! Game
                currentGame.createdAt = NSDate()
                appDelegate?.saveContext()
                
                self.dismissViewControllerAnimated(true, completion: nil)
                })
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

