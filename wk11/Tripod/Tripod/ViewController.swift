//
//  ViewController.swift
//  Tripod
//
//  Created by Thomas Sesselmann on 5/05/2015.
//  Copyright (c) 2015 Thomas Sesselmann. All rights reserved.
//

import UIKit
import SwiftyJSON


class ViewController: UIViewController {
    
    func getData(url: NSURL, completionHandler: (JSON) -> ()) {
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url) { data, response, error in
            let dataFromJSON = JSON(data: data)
        }
        
        task.resume()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "https://api.bitfinex.com/v1/ticker/btcusd")
        getData(url!) { prices in
            
            if let midPrice = prices["mid"].string {
                println(midPrice)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

