//
//  AddViewController.swift
//  To_Do_List_App
//
//  Created by Panacloud on 09/02/2015.
//  Copyright (c) 2015 Panacloud. All rights reserved.
//

import UIKit

class AddViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var DescriptionField: UITextField!
    
    var check:Bool = true
    var index:Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if check {
            Button.setTitle("Add", forState: UIControlState.Normal)
        }else{
            Button.setTitle("Edit", forState: UIControlState.Normal)

        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        Name.resignFirstResponder()
        DescriptionField.resignFirstResponder()
        return true
    }
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    @IBAction func Add(sender: AnyObject) {
        
        if Name.text != "" && DescriptionField.text != "" {
        
        if check {
//            println("true")
//            TODODATA.AddData(Name.text)
            TODODATA.FireBaseData(Name.text,Description: DescriptionField.text)
            

        }else{
//            println("false=\(index)")
            TODODATA.EditData(Name.text, index: index, Description: DescriptionField.text)
            

        }
        
        self.navigationController?.popViewControllerAnimated(true)
        }

    }

}
