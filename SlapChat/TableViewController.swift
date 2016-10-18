//
//  TableViewController.swift
//  SlapChat
//
//  Created by susan lovaglio on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
    
    var localMessages = [Message]()
    var store = DataStore.sharedDataStore

    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fetchData()
        self.localMessages = store.messages
        if self.localMessages.isEmpty {
            generateTestData()
            self.localMessages = store.messages
        }
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }
    
    func viewWillAppear() {
        store.fetchData()
        self.localMessages = store.messages
        self.tableView.reloadData()
    
    }
    
    func generateTestData()
    {
    
        var firstMessage = NSEntityDescription.insertNewObjectForEntityForName("Message", inManagedObjectContext: store.managedObjectContext) as! Message
        firstMessage.content = "THIS IS THE FIRST MESSAGE"
        firstMessage.createdAt = NSDate()
        
        var secondMessage = NSEntityDescription.insertNewObjectForEntityForName("Message", inManagedObjectContext: store.managedObjectContext) as! Message
        secondMessage.content = "THIS IS THE SECOND MESSAGE"
        secondMessage.createdAt = NSDate()
        
        var thirdMessage = NSEntityDescription.insertNewObjectForEntityForName("Message", inManagedObjectContext: store.managedObjectContext) as! Message
        thirdMessage.content = "THIS IS THE THIRD MESSAGE"
        thirdMessage.createdAt = NSDate()
        
        var fourthMessage = NSEntityDescription.insertNewObjectForEntityForName("Message", inManagedObjectContext: store.managedObjectContext) as! Message
        fourthMessage.content = "THIS IS THE FOURTH MESSAGE"
        fourthMessage.createdAt = NSDate()
        
        store.saveContext()
        store.fetchData()
    
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.localMessages.count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("basicCell", forIndexPath: indexPath)
        
        cell.textLabel!.text = self.localMessages[indexPath.row].content
        
        return cell
    }
}
