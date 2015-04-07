// Playground - noun: a place where people can play

import UIKit

@objc protocol Vehicle {
    func drive() -> Bool
    
    optional func startEngine() -> Bool
}

class Sedan : Vehicle {
    func drive() -> Bool {
        return true
    }
}

class Batmobil : Vehicle {
    func drive() -> Bool {
        return true
    }
}

class Commuter {
    func travel(modeOfTravel : Vehicle) {
        modeOfTravel.drive()
    }
}

let c = Commuter()
let s = Sedan()

c.travel(s)

