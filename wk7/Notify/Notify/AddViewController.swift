//
//  AddViewController.swift
//  Notify
//
//  Created by Thomas Sesselmann on 7/04/2015.
//  Copyright (c) 2015 Thomas Sesselmann. All rights reserved.
//

import UIKit

let TOMUserAddedRecord = "UserAddedRecord"

class AddViewController: UIViewController {

    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButtonTapped(sender: UIButton) {
        
        let data : [String : String] = ["firstName" : firstNameField.text, "lastName" : lastNameField.text]
        
        let notificationCentre = NSNotificationCenter.defaultCenter()
        notificationCentre.postNotificationName(TOMUserAddedRecord, object: self, userInfo: data)
        
        navigationController?.popViewControllerAnimated(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
