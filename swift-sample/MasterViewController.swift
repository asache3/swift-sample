//
//  MasterViewController.swift
//  swift-sample
//
//  Created by Asakura, Masayoshi | Asache | NEWSD on 7/23/14.
//  Copyright (c) 2014 asache3. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    //var objects = NSMutableArray()


    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // self.navigationItem.leftBarButtonItem = self.editButtonItem()

        //let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        //self.navigationItem.rightBarButtonItem = addButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    func insertNewObject(sender: AnyObject) {
        if objects == nil {
            objects = NSMutableArray()
        }
        objects.insertObject(NSDate.date(), atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    */

    // MARK: - Segues
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if segue.identifier == "showDetail" {
            let indexPath = self.tableView.indexPathForSelectedRow()
            let object = indexPath.row as Int
            (segue.destinationViewController as DetailViewController).detailItem = object
        }

    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

        //let object = objects[indexPath.row] as NSDate
        switch indexPath.row {
        case 0:
            cell.textLabel.text = "Label"
        case 1:
            cell.textLabel.text = "Button"
        case 2:
            cell.textLabel.text = "Switch"
        case 3:
            cell.textLabel.text = "Slider"
        case 4:
            cell.textLabel.text = "TextField"
        case 5:
            cell.textLabel.text = "TextView"
        case 6:
            cell.textLabel.text = "DatePicker"
        case 7:
            cell.textLabel.text = "Picker"
        case 8:
            cell.textLabel.text = "AlertView"
        case 9:
            cell.textLabel.text = "ActionSheet"
        case 10:
            cell.textLabel.text = "MotionEffect"
        default:
            cell.textLabel.text = ""
        }
        
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    /*
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            objects.removeObjectAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    */

}

