// Playground - noun: a place where people can play

/*
Game has players
Game has player types:
Good guys
Bad guys
All players have 100 health to start with
Add different types of good guys and bad guys with their own special moves
Make it so players can only attack the opposite type (good can only attack bad and vice versa)
Default attack power to 20 points.
Attack status and player life is displayed on each attack.

Note: Instructors and TA’s to watch the teams to make sure that both students are comfortable embarking on the bonus content.

Bonus: Create a match class that starts a match and accepts a good  guy and a bad guy. Each player hits each other in turn until the other player is out of life.

Bonus 2: Make it so each attack does a random amount of damage between 0 and 20. If the attack does 0 damage, give the players feedback that the attack was blocked (give students hint: arcrandom_uniform method).
*/

import UIKit

enum Alignment {
    case Good, Bad, Neutral
}

struct Ability {
    let name : String
    let mana : Double
    let damage : Double
}

class Player {
    
    // Instance Variables
    let name : String
    var health : Double
    var strength : Double
    var mana : Double
    var critChance : Double
    var alignment : Alignment
    var abilities : [Ability]
    
    // Initialiser
    init (name : String) {
        self.name = name
        self.health = 100
        self.strength = 5
        self.mana = 50
        self.critChance = 0.05
        self.alignment = .Neutral
        self.abilities = [Ability(name: "Punch", mana: 0, damage: 2)]
    }
    
    func attack(target : Player) {
        var selectedAbility = self.abilities[random() % self.abilities.count]
        while selectedAbility.mana >= self.mana {
            selectedAbility = self.abilities[random() % self.abilities.count]
        }
        var damageMultiplier = 1.0
        if Double(random() % 100) / 100 <= self.critChance {
            damageMultiplier = 2.0
            println("Critical Hit!")
        }
        let totalDamage = self.strength * selectedAbility.damage * damageMultiplier * 1 - (Double(random() % 50) / 100 - 0.25)
        target.health -= totalDamage
        self.mana -= selectedAbility.mana
        println("\(self.name) hit \(target.name) with \(selectedAbility.name) for \(totalDamage) damage! \(target.name) has \(target.health) health left.")
        if target.health <= 0 {
            println("\(target.name) is dead!")
        }
    }
    
}

class GoodGuy : Player {
    override init(name : String) {
        super.init(name: name)
        self.alignment = .Good
        self.abilities += [Ability(name: "Holy Smit", mana: 10, damage: 4)]
    }
    
    override func attack(target: Player) {
        if target.alignment == .Good {
            return
        }
        super.attack(target)
        
    }
    
}

class BadGuy : Player {
    override init(name : String) {
        super.init(name: name)
        self.alignment = .Bad
        self.abilities += [Ability(name: "Shadow Bolt", mana: 20, damage: 6)]
    }
    
    override func attack(target: Player) {
        if target.alignment == .Bad {
            return
        }
        super.attack(target)
        
    }
    
}

func chooseATarget(player : Player, players : [Player]) -> Player {
    var currentTarget = players[random() % players.count]
    while currentTarget.health <= 0 || currentTarget.alignment == player.alignment {
        currentTarget = players[random() % players.count]
    }
    return currentTarget
}


var players = [
    GoodGuy(name: "Luke Skywalker"),
    BadGuy(name: "DarthVader")
]

var endOfBattle = false

while !endOfBattle {
    for player in players {
        if player.health > 0 {
            player.attack(chooseATarget(player, players))
        }
    }
    
    var playersAlive : [Player] = []
    var alignmentsLeft : [Alignment] = []
    for player in players {
        if player.health > 0 {
            playersAlive += [player]
            if !contains(alignmentsLeft, player.alignment) {
                alignmentsLeft += [player.alignment]
            }
        }
    }
    
    playersAlive
    
    if playersAlive.count <= 1 {
        endOfBattle = true
        for player in playersAlive {
            print("\(player.name), ")
        }
        print(" are the winners")
    }
}


