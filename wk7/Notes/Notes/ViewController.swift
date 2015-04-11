//
//  ViewController.swift
//  Notes
//
//  Created by Thomas Sesselmann on 9/04/2015.
//  Copyright (c) 2015 Thomas Sesselmann. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var appDelegate: AppDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        let notesFetchRequest = NSFetchRequest(entityName: "Note")
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: false)
        notesFetchRequest.sortDescriptors = [sortDescriptor]
        
        if let notes = appDelegate!.managedObjectContext!.executeFetchRequest(notesFetchRequest, error: nil) as? [Note] {
            for note in notes {
//                note.text = "Hello World"
                appDelegate?.saveContext()
                println(note.title)
                println(note.text)
                
//                appDelegate?.managedObjectContext?.deleteObject(note)
            }
        }
    }


}

