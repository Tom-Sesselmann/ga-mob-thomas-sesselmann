//
//  ViewController.swift
//  Toms Calculator
//
//  Created by Thomas Sesselmann on 31/03/2015.
//  Copyright (c) 2015 Thomas Sesselmann. All rights reserved.
//

import UIKit

enum Operation : String {
    case addition       = "+"
    case subtraction    = "−"
    case multiplication = "×"
    case division       = "÷"
}

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
        
        let digitText = sender.titleForState(.Normal)!
        
        // Start new number state
        if state == "operation" {
            state = "number"
            screenLabel.text = ""
        }
        
        // Decimal point special cases
        if digitText == "." {
            
            // Enter leading zero for decimal point numbers
            if screenLabel.text == "" {
                screenLabel.text! += "0"
            }
            
            // Only have 1 decimal point in string
            else if (find(screenLabel.text!, ".") != nil) {
                return
            }
        }
        screenLabel.text! += "\(digitText)"
        
    }
    
    
    @IBAction func operationButtonPressed(sender: OperationButton) {
        
        let operationText = sender.titleForState(.Normal)!
        
        // Start new operation state and run the calculation for the previous operation
        if state == "number" {
            state = "operation"
            secondNumber = (screenLabel.text! as NSString).floatValue
            calculate()
        }
        
        lastOperation = operationText
    }
    
    
    // Combine this into operationButtonPressed function?
    @IBAction func equalsButtonPressed(sender: EqualsButton) {
        if state == "number" {
            state = "operation"
            secondNumber = (screenLabel.text! as NSString).floatValue
        }
        
        calculate()
        
    }
    
    
    @IBAction func screenSwiped(sender: AnyObject) {
        clear()
    }
    
    
    func calculate() {
        
        switch lastOperation {
            
        case Operation.addition.rawValue:
            firstNumber += secondNumber
            
        case Operation.subtraction.rawValue:
            firstNumber -= secondNumber
            
        case Operation.multiplication.rawValue:
            firstNumber *= secondNumber
            
        case Operation.division.rawValue:
            
            // Can't divide by zero!
            if secondNumber == 0 {
                clear()
                screenLabel.text = "Error"
                return
            }
            
            firstNumber /= secondNumber
            
        default:
            println("why do I need a default")
        }
        
        // Remove decimal point if number is an int and set screenLabel to the answer
        if floor(firstNumber) == firstNumber {
            screenLabel.text = "\(Int(firstNumber))"
        }
        
        else {
            screenLabel.text = "\(firstNumber)"
        }
        
    }
    
    func clear() {
        screenLabel.text = "0"
        firstNumber = 0.0
        secondNumber = 0.0
        lastOperation = "+"
        state = "operation"
    }
}

