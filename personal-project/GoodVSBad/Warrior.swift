//
//  Warrior.swift
//  GoodVSBad
//
//  Created by Thomas Sesselmann on 14/06/2015.
//  Copyright (c) 2015 ACME Inc. All rights reserved.
//
//  --- "Warrior" ---
//  - hp: 200
//  - mp: 100
//  - ap: 10
//  -- abilities
//  - 'Block'
//  The next 2 attacks against you do 50% less damage.
//  mp: 20
//  cd: 5s
//  - 'Enrage'
//  Your attack power increases by 20%. This ability can stack.
//  mp: 40
//  du: 10s
//  cd: 6s

import UIKit

class Warrior: GoodGuy {
    
    override init () {
        super.init()
        self.maxHealth = 200.0
        self.health = 200.0
        self.maxMana = 100.0
        self.mana = 100.0
        self.initAttackPower = 10.0
        self.attackPower = 10.0
        self.name = "Warrior"
    }
   
}
