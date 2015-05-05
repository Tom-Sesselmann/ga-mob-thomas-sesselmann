//
//  ViewController.swift
//  GoodVSBad
//
//  Created by Jack Watson-Hamblin on 12/03/2015.
//  Copyright (c) 2015 ACME Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var heroHealthBarWidth: NSLayoutConstraint!
    @IBOutlet weak var heroHealthBarCnt: HealthBar!
    @IBOutlet weak var villianHealthBarWidth: NSLayoutConstraint!
    @IBOutlet weak var villianHealthBarCnt: UIView!
    
    
    let superHero = SuperHero(name: "Superman")
    let superVillain = SuperVillain(name: "Batman")

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func superHeroAttack(sender: AnyObject) {
        
        println("Super Hero Attacks")
        let damageValue = superHero.attack(superVillain)
        
        
        
        var damageLabel = UILabel(frame: CGRectMake(0, 0, 20, 20))
        let x = arc4random_uniform(UInt32(self.view.frame.width) - 50) + 25
        let y = arc4random_uniform(UInt32(self.view.frame.height/2) - 50) + 50
        damageLabel.center = CGPointMake(CGFloat(x), CGFloat(y))
        
        
        damageLabel.textAlignment = NSTextAlignment.Center
        damageLabel.text = "\(damageValue)"
        self.view.addSubview(damageLabel)
        
        
        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.CurveLinear, animations: {
            damageLabel.alpha = 0
            self.villianHealthBarWidth.constant = -(self.villianHealthBarCnt.frame.width + 4 - CGFloat(self.superVillain.health / self.superVillain.maxHealth) * self.villianHealthBarCnt.frame.width)
            self.view.layoutIfNeeded()
            
            }, completion: nil)
        
        
        checkGameOver(superVillain)
    }
    
    @IBAction func superVillainAttack(sender: AnyObject) {
        println("Super Villain Attacks")
        
        let damageValue = superVillain.attack(superHero)
        
        var damageLabel = UILabel(frame: CGRectMake(0, 0, 20, 20))
        damageLabel.center = CGPointMake(160, 484)
        damageLabel.textAlignment = NSTextAlignment.Center
        damageLabel.text = "\(damageValue)"
        self.view.addSubview(damageLabel)
        
        
        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.CurveLinear, animations: {
            damageLabel.alpha = 0
            self.heroHealthBarWidth.constant = self.heroHealthBarCnt.frame.width + 4 - CGFloat(self.superHero.health / self.superHero.maxHealth) * self.heroHealthBarCnt.frame.width
            self.view.layoutIfNeeded()
            
            }, completion: nil)
        
        checkGameOver(superHero)
    }
    
    
    func checkGameOver(player : Player) {
        if player.health <= 0 {
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

