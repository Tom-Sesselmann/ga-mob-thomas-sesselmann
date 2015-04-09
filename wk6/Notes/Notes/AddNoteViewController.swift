//
//  AddNoteViewController.swift
//  Notes
//
//  Created by Thomas Sesselmann on 9/04/2015.
//  Copyright (c) 2015 Thomas Sesselmann. All rights reserved.
//

import UIKit
import CoreData

class AddNoteViewController: UIViewController {
    
    var appDelegate: AppDelegate?

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.appDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        let note = NSEntityDescription.insertNewObjectForEntityForName("Note", inManagedObjectContext: appDelegate!.managedObjectContext!) as! Note
        note.title = titleField.text
        note.text = textView.text
        
        appDelegate?.saveContext()
    }
    
    @IBAction func saveNote(sender: AnyObject) {
//        let note = NSEntityDescription.insertNewObjectForEntityForName("Note", inManagedObjectContext: appDelegate!.managedObjectContext!) as! Note
//        note.title = titleField.text
//        note.text = textView.text
//        
//        appDelegate?.saveContext()
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
