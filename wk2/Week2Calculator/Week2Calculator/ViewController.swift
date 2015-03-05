//
//  ViewController.swift
//  Week2Calculator
//
//  Created by Thomas Sesselmann on 3/03/2015.
//  Copyright (c) 2015 Thomas Sesselmann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    struct button {
        let name : String
        let colour : UIColor
    }
    
    let buttons = [
        "C"   : button(name: "C",   colour: UIColor.darkGrayColor()),
        "+/-" : button(name: "+/-", colour: UIColor.darkGrayColor()),
        "%"   : button(name: "%",   colour: UIColor.darkGrayColor()),
        "÷"   : button(name: "÷",   colour: UIColor.orangeColor()),
        "7"   : button(name: "7",   colour: UIColor.lightGrayColor()),
        "8"   : button(name: "8",   colour: UIColor.lightGrayColor()),
        "9"   : button(name: "9",   colour: UIColor.lightGrayColor()),
        "✕"   : button(name: "✕",   colour: UIColor.orangeColor()),
        "4"   : button(name: "4",   colour: UIColor.lightGrayColor()),
        "5"   : button(name: "5",   colour: UIColor.lightGrayColor()),
        "6"   : button(name: "6",   colour: UIColor.lightGrayColor()),
        "-"   : button(name: "-",   colour: UIColor.orangeColor()),
        "1"   : button(name: "1",   colour: UIColor.lightGrayColor()),
        "2"   : button(name: "2",   colour: UIColor.lightGrayColor()),
        "3"   : button(name: "3",   colour: UIColor.lightGrayColor()),
        "+"   : button(name: "+",   colour: UIColor.orangeColor()),
        "0"   : button(name: "0",   colour: UIColor.lightGrayColor()),
        "."   : button(name: ".",   colour: UIColor.lightGrayColor()),
        "="   : button(name: "=",   colour: UIColor.orangeColor())
        
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for data in buttons {
            let button = UIButton()
            button.setTitle(data.name, forState: .Normal)
            myFirstButton.backgroundColor = data.colour
            
        }
        
//        let myFirstLabel = UILabel()
        let myFirstButton = UIButton()
//        myFirstLabel.text = "I made a label on the screen"
//        myFirstLabel.font = UIFont(name: "MarkerFelt-Thin", size: 45)
//        myFirstLabel.textColor = UIColor.redColor()
//        myFirstLabel.textAlignment = .Center
//        myFirstLabel.numberOfLines = 5
//        myFirstLabel.frame = CGRectMake(15, 54, 300, 500)
        myFirstButton.setTitle("C", forState: .Normal)
        
        myFirstButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        myFirstButton.backgroundColor = UIColor.grayColor()
        
        
        myFirstButton.frame = CGRectMake(30, 50, 200, 100)
        
        
        
        myFirstButton.addTarget(self, action: "pressed:", forControlEvents: .TouchUpInside)
        self.view.addSubview(myFirstLabel)
        self.view.addSubview(myFirstButton)
    }
    
    func pressed(sender: UIButton!) {
        var alertView = UIAlertView();
        alertView.addButtonWithTitle("Ok");
        alertView.title = "title";
        alertView.message = "message";
        alertView.show();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

