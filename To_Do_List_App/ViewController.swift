//
//  ViewController.swift
//  To_Do_List_App
//
//  Created by Panacloud on 09/02/2015.
//  Copyright (c) 2015 Panacloud. All rights reserved.
//

import UIKit
var key=[String]()
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {

    @IBOutlet weak var toDoListTableView: UITableView!
    var deletedKey:Int=0
    var editedKey:Int=0

    var index:Int!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        myRootRef.observeEventType(.ChildAdded, withBlock: { snapshot in
            
            var name:AnyObject = snapshot.value.objectForKey("name")!
            var des:AnyObject = snapshot.value.objectForKey("description")!
            println("\(name)","\(des)","\(snapshot.key)")
            TODODATA.AddData("\(name)", Description: "\(des)")
            key.append(snapshot.key)
            self.toDoListTableView.reloadData()

            
        })
        
        myRootRef.observeEventType(.ChildRemoved, withBlock: { snapshot in
            TODODATA.dataAray.removeAtIndex(self.deletedKey)
        self.toDoListTableView.reloadData()

        })
        
        myRootRef.observeEventType(.ChildChanged, withBlock: { snapshot in
           
            var name:AnyObject = snapshot.value.objectForKey("name")!
            var des:AnyObject = snapshot.value.objectForKey("description")!
            var title = snapshot.key
            TODODATA.dataAray.removeAtIndex(self.editedKey)
//            TODODATA.EditData("\(name)", index: self.editedKey, Description: "\(des)")
            TODODATA.dataAray.insert(data(nameData: "\(name)",Description: "\(des)"), atIndex: self.editedKey)
            self.toDoListTableView.reloadData()
        })

    }
    
    override func viewWillAppear(animated: Bool) {
       
        
    
        
//        myRootRef.observeEventType(.ChildAdded, withBlock: {
//            snapshot in
//            println("\(snapshot.key) -> \(snapshot.value)")
//
//            TODODATA.AddData("\(snapshot.value)", Description: "\(snapshot.value)")
//            self.toDoListTableView.reloadData()
//
//        })
      
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:TO_DO_CELL_TableViewCell = toDoListTableView.dequeueReusableCellWithIdentifier("cell")! as TO_DO_CELL_TableViewCell
        cell.Name.text = TODODATA.dataAray[indexPath.row].nameData
        cell.DescriptionLabel.text=TODODATA.dataAray[indexPath.row].Description

        return cell
        
        
        
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return TODODATA.dataAray.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
       
        if editingStyle == UITableViewCellEditingStyle.Delete {
           
//            TODODATA.dataAray.removeAtIndex(indexPath.row)
    
            var myRoot = Firebase(url: "\(myRootRef)"+"/"+"\(key[indexPath.row])")
            key.removeAtIndex(indexPath.row)
            deletedKey=indexPath.row
//            println(myRoot)
            myRoot.removeValue()
//            toDoListTableView.reloadData()
        }
    }
    
  
  
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let temp = segue.destinationViewController as AddViewController
        if segue.identifier == "Add"{
            
            temp.check=true
        }else{

            temp.index=self.toDoListTableView.indexPathForSelectedRow()?.row
            self.editedKey=temp.index
            temp.check=false
 
        }
        
    }
}

