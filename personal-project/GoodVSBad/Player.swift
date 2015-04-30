//
//  Player.swift
//  GoodVSBad
//
//  Created by Jack Watson-Hamblin on 12/03/2015.
//  Copyright (c) 2015 ACME Inc. All rights reserved.
//

import Foundation

class Player {
    let maxHealth = 100.0
    var health = 100.0
    let name: String
    
    init (name: String) {
        self.name = name
    }
    
    // (Player) -> ()
    func attackOpponent(player: Player) -> Int {
        let damage = Int(arc4random_uniform(20))
        player.health -= Double(damage)
        
        checkIfPlayer(player, blockedDamage: damage)
        checkIfPlayerDied(player)
        return damage
    }
    
    private
    
    func checkIfPlayer(player: Player, blockedDamage damage: Int) {
        if (damage > 0) {
            // Black Beard did 5 damage to Luke Skywalker
            println("\(self.name) did \(damage) damage to \(player.name)")
        } else {
            // Luke Skywalker blocked Black Beard's attack
            println("\(player.name) blocked \(self.name)'s attack")
        }
    }
    
    func checkIfPlayerDied(player: Player) {
        if (player.health <= 0) {
            println("\(player.name) is dead.")
        }
    }
}