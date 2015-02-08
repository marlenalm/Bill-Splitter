//
//  SecondViewController.swift
//  Bill Splitter
//
//  Created by Marlena Morshead on 2/7/15.
//  Copyright (c) 2015 Marlena Morshead. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var txtTask: UITextField!
    @IBOutlet var txtDesc: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //events
    @IBAction func btnAddTask_Click(sender: UIButton) {
        taskMgr.addTask(txtTask.text, desc: txtDesc.text);
        self.view.endEditing(true)
        txtTask.text = ""
        txtDesc.text = ""
        self.tabBarController?.selectedIndex = 0;
    }
    
    //IOS touch funcitons
    override func touchesBegan(touches: (NSSet!), withEvent event: UIEvent!) {
        self.view.endEditing(true)
    }

    //UITextField Delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        textField.resignFirstResponder();
        return true
    }
}

