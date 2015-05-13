//
//  logInViewController.swift
//  Bloggr
//
//  Created by Thomas Sesselmann on 12/05/2015.
//  Copyright (c) 2015 Thomas Sesselmann. All rights reserved.
//

import UIKit
import Parse

class logInViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var logInButton: UIButton!
    
    @IBAction func logInTapped(sender: UIButton) {
        activityIndicator.startAnimating()
        logInButton.enabled = false
        
        PFUser.logInWithUsernameInBackground(emailField.text, password: passwordField.text) { user, error in
            self.activityIndicator.stopAnimating()
            self.logInButton.enabled = true
            if let error = error {
                let errorString = error.userInfo?["error"] as? String
                
                let alert = UIAlertView(title: "Log In Failed", message: errorString, delegate: nil, cancelButtonTitle: "OK")
                alert.show()
            } else {
                let alert = UIAlertView(title: "Success", message: "", delegate: nil, cancelButtonTitle: "OK")
                alert.show()
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let currentUser = PFUser.currentUser() {
            
            // Create post with user
            let newPost = PFObject(className: "Post")
            newPost["title"] = "Hello World"
            newPost["user"] = currentUser
            
            let userEditEveryoneReadACL = PFACL(user: currentUser)
            userEditEveryoneReadACL.setPublicReadAccess(true)
            
            newPost.saveInBackground()
            
            // Find posts by user
            let userPostsQuery = PFQuery(className: "Post")
            userPostsQuery.whereKey("user", equalTo: currentUser)
            userPostsQuery.findObjectsInBackground()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
