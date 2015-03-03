// Intro to Swift in class playground

import Foundation

// TODO: Create two variables, name and age. Name is a string, age is an integer.

var name : String = "Tom"
var age :Int = 24


// TODO: Print "Hello {whatever the value of name is}, you are {whatever the value of age is} years old!"

println("Hello \(name), you are \(age) years old!")


// TODO: Print “You can drink” below the above text if the user is above 21. If they are above 18, print “you can vote”. If they are above 16, print “You can drive”

if age >= 21 {
    println("You can drink")
}

if age >= 18 {
    println("You can vote")
}

if age >= 16 {
    println("You can drive")
}


// TODO: Print “you can drive” if the user is above 16 but below 18. It should print “You can drive and vote” if the user is above 18 but below 21. If the user is above 21, it should print “you can drive, vote and drink (but not at the same time!”.

if age >= 16 && age < 18 {
    println("You can drive")
} else if age >= 18 && age < 21 {
    println("You can drive and vote")
} else if age >= 21 {
    println("you can drive, vote and drink (but not at the same time!)")
}

// TODO: Create a constant called number

let number = 42


// TODO: Print whether the above number is even

if number % 2 == 0 {
    println("\(number) is an even number")
} else {
    println("\(number) is an odd number")
}


// TODO: Print the first fifty multiples of seven minus one (e.g. the first three multiples are 7, 14, 21. The first three multiples minus one are 6, 13, 20)

for i in 1...50 {
    println(i * 7 - 1)
}


// TODO: Print out "Hello {whatever the value of name is}, your name is {however long the string name is} characters long!. Use countElements()

println("Hello \(name), your name is \(countElements(name)) characters long!.")

// TODO: Print the sum of one hundred random numbers. Use rand() to generate random numbers.

var sum = 0

for i in 1...100 {
    sum += Int(rand())
}

println(sum)


// Bonus TO DO: Write a program that prints the numbers from 1 to 100. But for multiples of three print “Fizz” instead of the number and for the multiples of five print “Buzz”. For numbers which are multiples of both three and five print “FizzBuzz”.

for i in 1...100 {
    if i % 3 == 0 && i % 5 == 0 {
        println("FizzBuzz")
    } else if i % 5 == 0 {
        println("Buzz")
    } else if i % 3 == 0 {
        println("Fizz")
    } else {
        println(i)
    }
}





