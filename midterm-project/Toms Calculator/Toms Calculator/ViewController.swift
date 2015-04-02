//
//  ViewController.swift
//  Toms Calculator
//
//  Created by Thomas Sesselmann on 31/03/2015.
//  Copyright (c) 2015 Thomas Sesselmann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var screenLabel: UILabel!
    
    var firstNumber : Float = 0.0
    var secondNumber : Float = 0.0
    var lastOperation : String = "+"
    var state : String = "operation"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func digitButtonPressed(sender: DigitButton) {
        if state == "operation" {
            state = "number"
            firstNumber += secondNumber
            screenLabel.text = ""
        }
        screenLabel.text! += "\(sender.titleForState(.Normal)!)"
        
    }
    
    
    @IBAction func operationButtonPressed(sender: OperationButton) {
        if state == "number" {
            state = "operation"
            secondNumber = (screenLabel.text! as NSString).floatValue
        }
        lastOperation = sender.titleForState(.Normal)!
    }
    

    @IBAction func equalsButtonPressed(sender: EqualsButton) {
        if state == "number" {
            state = "operation"
            secondNumber = (screenLabel.text! as NSString).floatValue
        }
        
        calculate()
        
    }
    
    
    @IBAction func screenSwiped(sender: AnyObject) {
        screenLabel.text = "0"
        firstNumber = 0.0
        secondNumber = 0.0
        lastOperation = "+"
        state = "operation"
    }
    
    func calculate() {
        println("\(firstNumber), \(secondNumber)")
        switch lastOperation {
        case "+":
            firstNumber += secondNumber
        case "−":
            firstNumber -= secondNumber
        case "×":
            firstNumber *= secondNumber
        case "÷":
            if secondNumber == 0 {
                screenLabel.text = "Error"
                return
            }
            firstNumber /= secondNumber
        default:
            println("error")
        }
        secondNumber = 0.0
        
        // Remove decimal point if number is an int
        if floor(firstNumber) == firstNumber {
            screenLabel.text = "\(Int(firstNumber))"
        } else {
            screenLabel.text = "\(firstNumber)"
        }
        
    }
}

