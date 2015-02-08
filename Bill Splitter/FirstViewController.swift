//
//  FirstViewController.swift
//  Bill Splitter
//
//  Created by Marlena Morshead on 2/7/15.
//  Copyright (c) 2015 Marlena Morshead. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tblTasks: UITableView!
    @IBOutlet var tblMyBill: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //returning to view
    override func viewWillAppear(animated: Bool) {
        tblTasks.reloadData();
        
    }
    
    //uitableview delete functions
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (tableView == tblTasks){
            if(editingStyle == UITableViewCellEditingStyle.Delete) {
                var t = taskMgr.tasks[indexPath.row]
                taskBill.addTask(t.name, desc: t.desc)
                println(t.name)
                taskMgr.tasks.removeAtIndex(indexPath.row)
                tblTasks.reloadData()
                tblMyBill.reloadData()
            }
        }
    }
    
    //UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return taskMgr.tasks.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "test")
        println(indexPath.row)
        if (tableView == tblTasks){
            cell.textLabel.text = taskMgr.tasks[indexPath.row].name
            cell.detailTextLabel?.text = taskMgr.tasks[indexPath.row].desc
        }
        return cell
    }
}

