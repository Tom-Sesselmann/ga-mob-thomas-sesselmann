//
//  Gladiator.swift
//  GoodVSBad
//
//  Created by Thomas Sesselmann on 14/06/2015.
//  Copyright (c) 2015 ACME Inc. All rights reserved.
//
//
//  --- "Gladiator" ---
//  - hp: 180
//  - mp: 80
//  - ap: 12
//  -- abilities
//  - 'Counter'
//  The next 2 attacks against you will automatically trigger your own attack.
//  mp: 30
//  cd: 5s
//  - 'Charge'
//  Reduces the cooldown of your basic attack by 20%. This ability stacks.
//  mp: 20
//  du: 10s
//  cd: 6s

import UIKit

class Gladiator: BadGuy {
    
    override init () {
        super.init()
        self.maxHealth = 180.0
        self.health = 180.0
        self.maxMana = 80.0
        self.mana = 80.0
        self.initAttackPower = 12.0
        self.attackPower = 12.0
        self.name = "Gladiator"
    }
    
}
