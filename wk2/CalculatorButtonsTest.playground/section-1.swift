 
import UIKit
 
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
    button(name: "✕",   colour: UIColor.orangeColor()),
    button(name: "4",   colour: UIColor.lightGrayColor()),
    button(name: "5",   colour: UIColor.lightGrayColor()),
    button(name: "6",   colour: UIColor.lightGrayColor()),
    button(name: "-",   colour: UIColor.orangeColor()),
    button(name: "1",   colour: UIColor.lightGrayColor()),
    button(name: "2",   colour: UIColor.lightGrayColor()),
    button(name: "3",   colour: UIColor.lightGrayColor()),
    button(name: "+",   colour: UIColor.orangeColor()),
    button(name: "0",   colour: UIColor.lightGrayColor()),
    button(name: ".",   colour: UIColor.lightGrayColor()),
    button(name: "=",   colour: UIColor.orangeColor())
    
]
 
 let vc = UIViewController()

 let width : CGFloat = 80
 var x : CGFloat = 0
 var y : CGFloat = 0
    
 for (data) in buttons {
    
    let button = UIButton()
    button.setTitle(data.name, forState: .Normal)
    button.backgroundColor = data.colour
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
    
    
    vc.view.addSubview(button)
    
 }
        
        
