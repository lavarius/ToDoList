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
        // Core Data Stuff added
        // need access to the appledelegate class, a specific one, get access to persistent container
        // we want this viewContext to work with our specific core data
        // First get the context from the appdelegate, allows us to interact with core data, bridge for core data and appdata can talk 
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            // Create a ToDoCoreData object and store it in core data itself
            // have to define an entity and managedObjectContext
            // Context? Representation of the database from core data.
            // This will make a new object in core data
            let toDo = ToDoCoreData(entity: ToDoCoreData.entity(), insertInto: context)
            
            if let titleTextFieldUnwrapped = titleTextField.text {
                toDo.item = titleTextFieldUnwrapped
                
                // Easy to work with
                toDo.importance = importanceSwitch.isOn
                
                // no need to append or repopulate since the core data should take care of this
            }
            // when you add something to core data, you want to save to core data, try?, it may or may not go the way we want it to
            try? context.save()
            
            // pop user back to main screen, have pushed into navigation stack, now want to pop back into the navigation stack
            navigationController?.popViewController(animated: true)
        }
        /* Removing this preCore Data Code
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
        */
        
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
