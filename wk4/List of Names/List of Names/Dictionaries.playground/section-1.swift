// Playground - noun: a place where people can play

import UIKit

let names = [
    "A" : ["Andy", "Amy", "Andrew"],
    "B" : ["Bob", "Billy"],
    "C" : ["Ciara", "Chris", "Charlie"]
]

let key = names.keys.array.sorted(<)[0]
names[key]
