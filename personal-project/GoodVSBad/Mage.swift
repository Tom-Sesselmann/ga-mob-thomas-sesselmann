//
//  Mage.swift
//  GoodVSBad
//
//  Created by Thomas Sesselmann on 14/06/2015.
//  Copyright (c) 2015 ACME Inc. All rights reserved.
//
//  --- "Mage" ---
//  - hp: 120
//  - mp: 200
//  - ap: 15
//  -- abilities
//  - 'Overcharge'
//  Your next attack does 250% damage.
//  mp: 50
//  du: 2s
//  cd: 10s
//  - 'Blink'
//  You become unattackable for 2 seconds.
//  mp: 20
//  du: 2s
//  cd: 6s

import UIKit

class Mage: GoodGuy {
    
    override init () {
        super.init()
        self.maxHealth = 120.0
        self.health = 120.0
        self.maxMana = 200.0
        self.mana = 200.0
        self.initAttackPower = 15.0
        self.attackPower = 15.0
        self.name = "Mage"
    }
   
}
