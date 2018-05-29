//
//  AddToDoVC.swift
//  ToDoList
//
//  Created by Mark Bartolo on 5/28/18.
//  Copyright © 2018 mlavarius. All rights reserved.
//

import UIKit

// create subclass AddToDoVC of UIViewController
class AddToDoVC : UIViewController {

    // Reference to previous ToDoController
    var previousVC = ToDoTVC()
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var importanceSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func addTapped(_ sender: Any) {
        let toDo = ToDo()
        // an Optional!
        //toDo.item = titleTextField.text!
        
        // Check to see if optional is nil, if not, then proceed
        // Using favorable code of if let to unwrap optional
        if let titleTextFieldUnwrapped = titleTextField.text {
            toDo.item = titleTextFieldUnwrapped
            
            // Easy to work with
            toDo.importance = importanceSwitch.isOn
            
            // take the above information and add it to the TVC
            previousVC.toDos.append(toDo)
            
            // need to repopulated the array in TVC
            previousVC.tableView.reloadData()
            
            // pop user back to main screen, have pushed into navigation stack, now want to pop back into the navigation stack
            navigationController?.popViewController(animated: true)
        }
        
    }
    
    
    
    
    
    /*
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    */
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
