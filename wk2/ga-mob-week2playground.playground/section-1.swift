// Playground - noun: a place where people can play

import UIKit

var name : String = "Tom"

var age : Int = 24

var hobbies : [String] = ["iPhone Games", "Soccer", "Other"]

println("My name is \(name). I am \(age). I like \(hobbies)")

for hobby in hobbies {
    println(hobby)
}

hobbies.reverse()
