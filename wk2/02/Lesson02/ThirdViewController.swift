//
//  ThirdViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
/*
    TODO six: Hook up the number input text field, button and text label to this class. When the button is pressed, a message should be printed to the label indicating whether the number is even.

*/
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    @IBAction func calculate(sender: AnyObject) {
        
        if let val : Int = textField.text.toInt() {
            if val % 2 == 0 {
                label.text = "\(val) is an even number"
            } else {
                label.text = "\(val) is an odd number"                
            }
        }
    }
}
