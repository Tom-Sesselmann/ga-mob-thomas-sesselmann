//
//  ViewController.swift
//  GoodVSBad
//
//  Created by Jack Watson-Hamblin on 12/03/2015.
//  Copyright (c) 2015 ACME Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let superHero = SuperHero(name: "Superman")
    let superVillain = SuperVillain(name: "Batman")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func superHeroAttack(sender: AnyObject) {
        println("Super Hero Attacks")
        superHero.attack(superVillain)
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

