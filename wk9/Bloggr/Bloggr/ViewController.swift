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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var blogPost = PFObject(className: "BlogPost")
        blogPost["title"] = "Hello World"
        blogPost["subtitle"] = "The classic blog post"
        blogPost["content"] = "Welcome to my blog swifters"
        blogPost.saveInBackground()
        
        var blogPostQuery = PFQuery(className: "BlogPost")
        blogPostQuery.whereKey("createdAt", lessThanOrEqualTo: NSDate())
//        blogPostQuery.findObjectsi
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

