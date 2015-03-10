// Playground - noun: a place where people can play

import UIKit

class Dog {
    let colour : String
    let gender : String
    
    init(colour : String, gender : String) {
        self.colour = colour
        self.gender = gender
    }
    
    func speak() {
        println("Woof!")
    }
    
    func doesLike(animal : Dog) -> Bool {
        return true
    }
    
    func doesLike(animal : Cat) -> Bool {
        return false
    }
}

class Cat {
    let colour : String
    let gender : String
    
    init(colour : String, gender : String) {
        self.colour = colour
        self.gender = gender
    }
    
    func speak() {
        println("Meow!")
    }

    func doesLike(animal : Dog) -> Bool {
        return false
    }

    func doesLike(animal : Cat) -> Bool {
        return true
    }
}

var spot = Dog(colour: "black", gender: "male")
spot.speak()

var alice = Cat(colour: "tabby", gender: "female")
spot.doesLike(alice)

var growlith = Dog(colour: "brown", gender: "male")
spot.doesLike(growlith)
