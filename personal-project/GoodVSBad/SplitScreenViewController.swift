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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startGame() {
        heroNavigationController.popToRootViewControllerAnimated(false)
        villianNavigationController.popToRootViewControllerAnimated(false)
        self.performSegueWithIdentifier("startGame", sender: self)
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
