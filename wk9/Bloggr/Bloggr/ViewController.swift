//
//  ViewController.swift
//  Bloggr
//
//  Created by Thomas Sesselmann on 23/04/2015.
//  Copyright (c) 2015 Thomas Sesselmann. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
    
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var subtitleField: UITextField!
    @IBOutlet weak var contentField: UITextView!

    @IBAction func savePost(sender: AnyObject) {
        var blogPost = PFObject(className: "BlogPost")
        blogPost["title"] = titleField.text
        blogPost["subtitle"] = subtitleField.text
        blogPost["content"] = contentField.text
        blogPost.saveInBackgroundWithBlock() { object, error in
                self.navigationController!.popViewControllerAnimated(true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        return
        
        // create new object to work with
        var blogPost = PFObject(className: "BlogPost")
        
        // set properties to have values
        blogPost["title"] = "Hello World"
        blogPost["subtitle"] = "The classic blog post"
        blogPost["content"] = "Welcome to my blog swifters"
        
        // save to Prase some time later
        blogPost.saveInBackground()
        
        // makes a query for "BlogPost" objects
        var blogPostQuery = PFQuery(className: "BlogPost")
        
        // limits the query to only posts created before now
        blogPostQuery.whereKey("createdAt", lessThanOrEqualTo: NSDate())
        
        // actually runs the query and gives them back to do something with
        blogPostQuery.findObjectsInBackgroundWithBlock() { objects, error in
            
            // check for existance of returned objects
            if let results = objects {
                
                // loop through all objects from parse
                for post in results {
                    
                    // print out data
                    println(post["title"])
                    println(post.createdAt)
                    
                    // set title = goodbye
                    post.setValue("Goodbye", forKey:"title")
                    
                    // upload the changes to Parse
                    post.saveInBackground()
                }
            }
                
            // Get the firs oject matching the query
            blogPostQuery.getFirstObjectInBackgroundWithBlock() { object, error in
                
                // check an object is there
                if let blogPost = object {
                
                    // delete the object
                    blogPost.deleteInBackground()
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

