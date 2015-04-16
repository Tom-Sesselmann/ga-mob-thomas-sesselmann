//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

XCPSetExecutionShouldContinueIndefinitely()

func add(x: Int, y: Int) -> Int {
    return x + y
}

func calculate(x: Int, y: Int, calculation: (Int, Int) -> (Int)) -> Int {
    let calMethod = calculation
    
    return calMethod(x, y)
}

calculate(1, 2) { x, y in x + y }

let url = NSURL(string: "http://google.com/")

var session = NSURLSession.sharedSession()
var request = session.dataTaskWithURL(url!) { (data, response, error) -> Void in
    let dataAsString = NSString(data: data, encoding: 1)
    
    println(dataAsString)
}

println("hello")
request.resume()
println("goodbye")
