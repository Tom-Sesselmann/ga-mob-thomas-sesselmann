//
//  ViewController.swift
//  GoodVSBad
//
//  Created by Jack Watson-Hamblin on 12/03/2015.
//  Copyright (c) 2015 ACME Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var healthBarWidth: NSLayoutConstraint!
    @IBOutlet weak var healthBarCnt: HealthBar!
    @IBOutlet weak var healthBar: UIView!
    
    
    let superHero = SuperHero(name: "Superman")
    let superVillain = SuperVillain(name: "Batman")

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func superHeroAttack(sender: AnyObject) {
        
        println("Super Hero Attacks")
        let damageValue = superHero.attack(superVillain)
        
        
        var damageLabel = UILabel(frame: CGRectMake(0, 0, 20, 20))
        damageLabel.center = CGPointMake(160, 284)
        damageLabel.textAlignment = NSTextAlignment.Center
        damageLabel.text = "\(damageValue)"
        self.view.addSubview(damageLabel)
        
        
        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.CurveLinear, animations: {
            damageLabel.alpha = 0
            self.healthBarWidth.constant += 10
            self.view.layoutIfNeeded()
            
            }, completion: nil)
        
        
        checkGameOver(superVillain)
    }
    
    @IBAction func superVillainAttack(sender: AnyObject) {
        println("Super Villain Attacks")
        superVillain.attack(superHero)
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

