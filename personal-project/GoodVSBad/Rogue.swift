//
//  Rogue.swift
//  GoodVSBad
//
//  Created by Thomas Sesselmann on 14/06/2015.
//  Copyright (c) 2015 ACME Inc. All rights reserved.
//
//  --- "Rogue" ---
//  - hp: 160
//  - mp: 120
//  - ap: 12
//  -- abilities
//  - 'Stun'
//  Your opponent cannot do anything for 3 seconds.
//  mp: 50
//  du: 3s
//  cd: 10s
//  - 'Expose'
//  Your opponent takes 15% extra damage. This ability can stack.
//  mp: 20
//  du: 8s
//  cd: 6s

import UIKit

class Rogue: GoodGuy {
    
    override init () {
        super.init()
        self.maxHealth = 160.0
        self.health = 160.0
        self.maxMana = 120.0
        self.mana = 120.0
        self.initAttackPower = 12.0
        self.attackPower = 12.0
        self.name = "Rogue"
    }
   
}
