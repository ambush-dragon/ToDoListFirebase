//
//  ToDoData.swift
//  To_Do_List_App
//
//  Created by Panacloud on 09/02/2015.
//  Copyright (c) 2015 Panacloud. All rights reserved.
//

import UIKit


var TODODATA:ToDoData = ToDoData()
var myRootRef = Firebase(url:"https://zubairtodolist.firebaseio.com/")

struct data {
   
    var nameData:String=""
    var Description:String=""
}

class ToDoData: NSObject {
    
   var dataAray=[data]()
    
    func AddData(name:String,Description:String){
        dataAray.append(data(nameData: name, Description: Description))

    }
    
    func EditData(name:String,index:Int,Description:String){
        
      
        
        
        myRootRef.updateChildValues( ["\(key[index])": ["name": name, "description": Description]])
       
    
        
    }
    
    
    func FireBaseData(name:String,Description:String){
     
        myRootRef.childByAutoId().setValue(["name": name, "description": Description])

    }

}