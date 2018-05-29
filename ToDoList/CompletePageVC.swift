//
//  CompletePageVC.swift
//  ToDoList
//
//  Created by Mark Bartolo on 5/29/18.
//  Copyright © 2018 mlavarius. All rights reserved.
//

import UIKit

class CompletePageVC: UIViewController {

    // Adding Properties
    // Add To Do TVC
    var previousVC = ToDoTVC()
    // variable that holds selected To Do Item, a generic ToDo() object
    var selectedToDo = ToDo()
    
    // Add Outlet
    @IBOutlet weak var ToDoItem: UILabel!
    
    // run code when loaded
    override func viewDidLoad() {
        super.viewDidLoad()

        // Display correct information inside title label
        ToDoItem.text = selectedToDo.item
    }
    // Action to take when button is tapped
    @IBAction func completeButton(_ sender: Any) {
        //create index var, and reset it each time button is tapped
        var index = 0
        // for loop to check which index we are going to remove
        for toDo in previousVC.toDos {
            
            if toDo.item == selectedToDo.item {
                // test
                // print("We found it!" \(toDo.item) \(index)")
                // go to previousVC.toDos and remove an item
                previousVC.toDos.remove(at: index)
                // reloadData of tableView UI because array is changed
                previousVC.tableView.reloadData()
                //pop back to menu
                navigationController?.popViewController(animated: true)
                // once found, stop it, and go
                break
            }
            // increase index each time we go through the loop
            index += 1
        }
    }
    /*
     
     override func didReceiveMemoryWarning() {
     super.didReceiveMemoryWarning()
     // Dispose of any resources that can be recreated.
     }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
