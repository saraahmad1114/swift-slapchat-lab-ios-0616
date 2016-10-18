//
//  AddMessageViewController.swift
//  SlapChat
//
//  Created by Flatiron School on 10/18/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData

class AddMessageViewController: UIViewController {

    @IBOutlet weak var newMessageTextField: UITextField!
    var store = DataStore.sharedDataStore
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newMessageTextField.backgroundColor = UIColor.blueColor()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        
        var newMessage = NSEntityDescription.insertNewObjectForEntityForName("Message", inManagedObjectContext: store.managedObjectContext) as! Message
        newMessage.content = newMessageTextField.text
        newMessage.createdAt = NSDate()
        
        store.saveContext()
        
        self.dismissViewControllerAnimated(false, completion: nil)

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
