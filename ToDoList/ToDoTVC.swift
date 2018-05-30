//
//  ToDoTVC.swift
//  ToDoList
//
//  Created by Mark Bartolo on 5/28/18.
//  Copyright © 2018 mlavarius. All rights reserved.
//

import UIKit

// creating a subclass called ToDoTVC of UITableViewController
class ToDoTVC : UITableViewController {
    
    // Create property to hold To Do Objects & arrays
    //Explicit statement of holding ToDo objects
    //var toDos : [ToDo] = []
    // we want the array of coreData objects
    var toDos : [ToDoCoreData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make a property of To Dos by calling a function and giving properties
        //toDos = createToDos() // removed, since we only want the user to make the list
        //print(toDos.count)
        
        // run the function to fetch core data
        getToDos()
    }
    
    // Fetch from Core Data
    func getToDos() {
        // Access Core Data, get context
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            // Fetch from Core Data specified by ToDoCoreData array core data objects
            if let coreDataToDos = try? context.fetch(ToDoCoreData.fetchRequest()) as? [ToDoCoreData] {
                //coreDataToDos is an optional so we safely unwrap it
                if let theToDos = coreDataToDos {
                    //print(theToDos.first?.itemName)
                    // made the change above to reference an array of CoreData objects
                    // toDos references that above
                    // asigning the unwrapped things from CoreData to this var array toDos, which is our list that goes into the VC
                    toDos = theToDos
                    // reload data, because array is changed
                    tableView.reloadData()
                }
                
            }
        }
    }
    // Create To do Items (Tester)
    func createToDos() -> [ToDo] {
        // why is this a constant? Constant objects, things inside it, are variables. That's why we can let eggs be a constant
        let eggs = ToDo()
        eggs.item = "Buy Eggs"
        eggs.importance = true
        
        let dog = ToDo()
        dog.item = "Walk the Dog"
        
        let cheese = ToDo()
        cheese.item = "Eat Cheese"
        
        return [eggs, dog, cheese]
    }
    
    // Number of Rows - However many is in the ToDos Array
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(toDos.count)
        return toDos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        // Configure the cell...
        // assign a variable that will contain our ToDo Class properties
        let toDo = toDos[indexPath.row]
        // where we specify things about the particular to do items are
        //cell.textLabel?.text = "hello"
        
        if let name = toDo.item {
            // show actual text now:
            if toDo.importance {
                cell.textLabel?.text = "❗️" + name
            } else {
                cell.textLabel?.text = name
            }
        }
        
        
        return cell
    }
    // react to the selection of an item on a cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //pass the indexPath.row item that was selected
        let toDo = toDos[indexPath.row]
        // identifer from VC, and sender is based on the selected item
        performSegue(withIdentifier: "segueToComplete", sender: toDo)
        
    }
    // prepare segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // legacy code:
        //let addVC = segue.destination as! AddToDoVC
        // using better version of code above, and only when we are segueing to AddToDoVC
        if let addVC = segue.destination as? AddToDoVC {
            addVC.previousVC = self
        }
        // sending this TVC's class information to next VC, where previousVC is initialized
        
        // Segue to the Complete ToDo List VC
        if let completeVC = segue.destination as? CompletePageVC {
            // communicate with the copmletePageVC by checking destination
            if let toDo = sender as? ToDo {
                // send in an optional and check
                completeVC.selectedToDo = toDo
                // set previousVC equal to self
                completeVC.previousVC = self
            }
            
        }
    }
    
    // --------------------------------------------------------------------------------------------------
    // Running out of RAM type of function
    /*
     override func didReceiveMemoryWarning() {
     super.didReceiveMemoryWarning()
     // Dispose of any resources that can be recreated.
     }
     
     // Don't need to mess with the number of Sections here... it screws with the numberOfRowsInSection
     override func numberOfSections(in tableView: UITableView) -> Int {
     // #warning Incomplete implementation, return the number of sections
     return 0
     }
     */
    // --------------------------------------------------------------------------------------------------
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
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
