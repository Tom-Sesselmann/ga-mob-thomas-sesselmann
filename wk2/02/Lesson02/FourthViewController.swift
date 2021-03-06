//
//  FourthViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
/*
    TODO seven: Hook up the text input box, label and and a ‘calculate’ button. Create a ‘fibonacci adder’ class with a method ‘fibonacciNumberAtIndex' which takes indexOfFibonacciNumber (an integer).  When the button is pressed, create an instance of that class, call the method, and print out the appropriate fibonacci number of an inputted integer.
    The first fibonacci number is 0, the second is 1, the third is 1, the fourth is two, the fifth is 3, the sixth is 5, etc. The Xth fibonacci number is the sum of the X-1th fibonacci number and the X-2th fibonacci number.
*/
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    
    @IBAction func calculate(sender: AnyObject) {
        
        // Create an instance of the FibonacciAdder class
        let fibonacciInstance = FibonacciAdder()
        
        if let val : Int = textField.text.toInt() {
            
            // Numbers greater than 94 will crash the app :(
            if val >= 94 {
                label.text = "Number is too large :("
                
            // Numbers less than 1 will also creash the app :(
            } else if val < 1 {
                label.text = "Must be a positive integer"
            
            } else {
                label.text = "\(fibonacciInstance.fibonacciNumberAtIndex(val))"
            }
        }
    }
}
