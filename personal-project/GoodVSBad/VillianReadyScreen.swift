//
//  VillianReadyScreen.swift
//  GoodVSBad
//
//  Created by Thomas Sesselmann on 29/05/2015.
//  Copyright (c) 2015 ACME Inc. All rights reserved.
//

import UIKit

class VillianReadyScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let heroClass = currentGame.heroClass {
            splitScreenViewController.startGame()
            
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        // Reset selected class
        currentGame.villianClass = nil
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.navigationController?.popToRootViewControllerAnimated(false)
    }


}
