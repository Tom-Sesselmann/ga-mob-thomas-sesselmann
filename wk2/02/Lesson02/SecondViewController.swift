//
//  SecondViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    //TODO five: Display the cumulative sum of all numbers added every time the ‘add’ button is pressed. Hook up the label, text box and button to make this work.
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    // Save the sum as a global variable
    var sum : Int = 0
    
    
    @IBAction func add(sender: AnyObject) {
        
        if let val : Int = textField.text.toInt() {
            sum += val
            label.text = "\(sum)"
        }
    }
}
