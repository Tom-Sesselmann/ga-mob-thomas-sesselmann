//
//  ViewController.swift
//  Bloggr
//
//  Created by Thomas Sesselmann on 12/05/2015.
//  Copyright (c) 2015 Thomas Sesselmann. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBAction func signUpTapped(sender: UIButton) {
        activityIndicator.startAnimating()
        signUpButton.enabled = false
        
        let newUser = PFUser()
        newUser.username = emailField.text
        newUser.email = emailField.text
        newUser.password = passwordField.text
        newUser.signUpInBackgroundWithBlock() { succeeded, error in
            self.activityIndicator.stopAnimating()
            self.signUpButton.enabled = true
            if let error = error {
                let errorString = error.userInfo?["error"] as? String
                
                let alert = UIAlertView(title: "Sign Up Failed", message: errorString, delegate: nil, cancelButtonTitle: "OK")
                alert.show()
            } else {
                let alert = UIAlertView(title: "Success", message: "", delegate: nil, cancelButtonTitle: "OK")
                alert.show()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

