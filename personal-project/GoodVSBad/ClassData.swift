//
//  ClassData.swift
//  GoodVSBad
//
//  Created by Thomas Sesselmann on 14/06/2015.
//  Copyright (c) 2015 ACME Inc. All rights reserved.
//
//  ===================
//  Classes
//  ===================
//  *** GOOD ***
//  -------------------
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
//
//  -------------------
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
//
//  -------------------
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
//
//  -------------------
//  --- "Priest" ---
//  - hp: 100
//  - mp: 180
//  - ap: 7
//  -- abilities
//  - 'Heal'
//  You heal yourself for 40 health.
//  mp: 30
//  cd: 6s
//  - 'Blind'
//  Your opponents next attack will hit himself.
//  mp: 60
//  du: 2s
//  cd: 10s
//
//  ===================
//  *** BAD ***
//  -------------------
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
//
//  --- "Sorcerer" ---
//  - hp: 140
//  - mp: 220
//  - ap: 14
//  -- abilities
//  - 'Shadow Blast'
//  Deals 150% of base damage and your opponent deals 30% less damage for 4 seconds.
//  mp: 60
//  du: 4s
//  cd: 7s
//  - 'Leach Magic'
//  Steal 20% of your opponents mana.
//  mp: 30
//  du: 10s
//  cd: 6s
//
//  --- "Thief" ---
//  - hp: 150
//  - mp: 140
//  - ap: 13
//  -- abilities
//  - 'Disarm'
//  Your opponent is unable to attack for 4 seconds.
//  mp: 40
//  du: 4s
//  cd: 10s
//  - 'Quick Strike'
//  Attack your opponent and deal 150% damage if your opponent is disarmed.
//  mp: 20
//  cd: 3s
//
//  --- "Warlock" ---
//  - hp: 120
//  - mp: 160
//  - ap: 9
//  -- abilities
//  - 'Drain Life'
//  You steal 25 health from your opponent.
//  mp: 40
//  cd: 6s
//  - 'Plague'
//  Your opponent takes 60 damage over 12 seconds. This ability stacks.
//  mp: 30
//  du: 12s
//  cd: 8s

import Foundation

let all = Class(name: "Warrior")

