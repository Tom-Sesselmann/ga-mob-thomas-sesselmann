//
//  ClassInfoScreen.swift
//  GoodVsBad
//
//  Created by Thomas Sesselmann on 23/03/2015.
//  Copyright (c) 2015 ACME Inc. All rights reserved.
//

import UIKit

class ClassInfoScreen: UITableViewController {
    
    var className : String?
    
    @IBOutlet weak var navItem: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navItem.title = className
        self.tableView.backgroundView = UIImageView(image: UIImage(named: className!))
        
    }

}
