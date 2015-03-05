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
        button(name: "C",   colour: UIColor.darkGrayColor()),
        button(name: "+/-", colour: UIColor.darkGrayColor()),
        button(name: "%",   colour: UIColor.darkGrayColor()),
        button(name: "÷",   colour: UIColor.orangeColor()),
        button(name: "7",   colour: UIColor.lightGrayColor()),
        button(name: "8",   colour: UIColor.lightGrayColor()),
        button(name: "9",   colour: UIColor.lightGrayColor()),
        button(name: "×",   colour: UIColor.orangeColor()),
        button(name: "4",   colour: UIColor.lightGrayColor()),
        button(name: "5",   colour: UIColor.lightGrayColor()),
        button(name: "6",   colour: UIColor.lightGrayColor()),
        button(name: "−",   colour: UIColor.orangeColor()),
        button(name: "1",   colour: UIColor.lightGrayColor()),
        button(name: "2",   colour: UIColor.lightGrayColor()),
        button(name: "3",   colour: UIColor.lightGrayColor()),
        button(name: "+",   colour: UIColor.orangeColor()),
        button(name: "0",   colour: UIColor.lightGrayColor()),
        button(name: ".",   colour: UIColor.lightGrayColor()),
        button(name: "=",   colour: UIColor.orangeColor())
        
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let width : CGFloat = 80
        var x : CGFloat = 0
        var y : CGFloat = 0
        
        for (data) in buttons {
            
            let button = UIButton()
            button.setTitle(data.name, forState: .Normal)
            button.titleLabel!.font =  UIFont(name: "HelveticaNeue-Thin", size: 30)
            button.backgroundColor = data.colour
            button.layer.borderWidth = 0.4
            self.view.addSubview(button)
            
            if data.colour == UIColor.orangeColor() {
                button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            } else {
                button.setTitleColor(UIColor.blackColor(), forState: .Normal)
            }
            
            if data.name == "0" {
                button.frame = CGRectMake(x, y, width * 2, width)
                x += width
            } else {
                button.frame = CGRectMake(x, y, width, width)
            }
            
            x += width
            if x >= width * 4 {
                x = 0
                y += width
            }
        }
        
//        myFirstButton.addTarget(self, action: "pressed:", forControlEvents: .TouchUpInside)
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

