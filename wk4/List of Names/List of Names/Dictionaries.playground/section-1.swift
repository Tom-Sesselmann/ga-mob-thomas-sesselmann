// Playground - noun: a place where people can play

import UIKit

let names2 = [
    "A" : ["Andy", "Amy", "Andrew"],
    "B" : ["Bob", "Billy"],
    "C" : ["Ciara", "Chris", "Charlie"]
]

let key2 = names2.keys.array.sorted(<)[0]
names2[key2]



struct Contact {
    let firstName : String
    let lastName : String
    let email : String?
    let phone : Int?
}

let names = [
    "A" : [
        Contact(firstName: "Andy", lastName: "Andy", email: nil, phone: nil),
        Contact(firstName: "Amy", lastName: "Amy", email: nil, phone: nil),
        Contact(firstName: "Andrew", lastName: "Andrew", email: nil, phone: nil)],
    "B" : [
        Contact(firstName: "Bob", lastName: "Bob", email: nil, phone: nil),
        Contact(firstName: "Billy", lastName: "Billy", email: nil, phone: nil)],
    "C" : [
        Contact(firstName: "Ciara", lastName: "Ciara", email: nil, phone: nil),
        Contact(firstName: "Chris", lastName: "Chris", email: nil, phone: nil),
        Contact(firstName: "Charlie", lastName: "Charlie", email: nil, phone: nil)]
]


let key = Array("hello")[0]

let str = "sess"

let key3 = "\(str[advance(str.startIndex, 0)])".uppercaseString

