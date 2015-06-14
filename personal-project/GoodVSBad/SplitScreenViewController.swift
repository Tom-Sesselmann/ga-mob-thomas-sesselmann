//
//  SplitScreenViewController.swift
//  GoodVSBad
//
//  Created by Thomas Sesselmann on 29/05/2015.
//  Copyright (c) 2015 ACME Inc. All rights reserved.
//

import UIKit

var splitScreenViewController: SplitScreenViewController!

class SplitScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        splitScreenViewController = self
    }
    
    func startGame() {
        heroNavigationController.popToRootViewControllerAnimated(false)
        villianNavigationController.popToRootViewControllerAnimated(false)
        self.performSegueWithIdentifier("startGame", sender: self)
    }

}
