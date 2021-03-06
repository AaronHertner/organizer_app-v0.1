//
//  AdvanceTableViewController.swift
//  organizer_app
//
//  Created by User on 2020-09-13.
//  Copyright © 2020 aaronhertner. All rights reserved.
//

import UIKit

class AdvanceTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: Properties
    var tasks = [Task]()
    
    var addButtonDest: CGPoint!
    var editButtonDest: CGPoint!
    
    //MARK: Outlets
    @IBOutlet weak var taskTableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var myTable: UITableView!
    
    //MARK: Actions
    //save function called on exit from segue
    @IBAction func unwindToTaskList(sender: UIStoryboardSegue){
        
        //if navigation bar is enabled - disable it
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        //check that the previous controller was a taskViewController
        if let sourceViewController = sender.source as? TaskViewController, let task = sourceViewController.task{
            
            //handle edit path
            if let selectedIndexPath = myTable.indexPathForSelectedRow{
                tasks[selectedIndexPath.row] = task
                myTable.reloadData()
            }
            else{
                let indexPath = IndexPath(row: tasks.count, section: 0)
                tasks.append(task)
                taskTableView.insertRows(at: [indexPath], with: .automatic)
            }
        }
    }
    
    @IBAction func hideAllAfterAddClick(_ sender: UIButton){
        moreButtonClicked(moreButton) //collapse menu
        if(!confirmButton.isHidden){confirmButton.isHidden = true}  //hide confirm button
        if(myTable.isEditing){myTable.setEditing(false, animated: false)}   //end editing
    }
    
    @IBAction func moreButtonClicked(_ sender: UIButton){
        if(addButton.center == moreButton.center){
            UIView.animate(withDuration: 0.2, animations: {
                self.addButton.center = self.addButtonDest
                self.editButton.center = self.editButtonDest
            })
        }else{
            UIView.animate(withDuration: 0.2, animations: {
                self.addButton.center = self.moreButton.center
                self.editButton.center = self.moreButton.center
            })
        }
    }
    
    @IBAction func enableEditing(_ sender: UIButton){
        if(myTable.isEditing){
            myTable.setEditing(false, animated: true)
            confirmButton.isHidden = true
        }else{
            myTable.setEditing(true, animated: true)
            moreButtonClicked(moreButton)   //collapse menu
            confirmButton.isHidden = false
        }
    }
    
    @IBAction func confirmEdits(_ sender: UIButton){
        myTable.setEditing(false, animated: true)
        confirmButton.isHidden = true
    }
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if(segue.identifier == "EditTask"){
            let taskDetailView = segue.destination as? TaskViewController   //destination
            let selectedCell = sender as? TaskTableViewCell                 //selected cell
            let indexPath = myTable.indexPath(for: selectedCell!)           //position of cell
            let selectedTask = tasks[indexPath!.row]                        //get the task info
            taskDetailView?.task = selectedTask                             //give task info to detail view
        }
    }
    
    //MARK: UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTableView.dataSource = self
        loadSampleTasks()
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        //stylize buttons
        stylizeButton(button: moreButton)
        stylizeButton(button: addButton)
        stylizeButton(button: editButton)
        stylizeButton(button: confirmButton)
        
        //store original button points
        addButtonDest = addButton.center
        editButtonDest = editButton.center
        
        //move buttons to default position
        addButton.center = moreButton.center
        editButton.center = moreButton.center
    }
    
    //MARK: Private Functions
    private func stylizeButton(button: UIButton){
        button.backgroundColor = AppDelegate.primaryColor
        button.layer.cornerRadius = button.frame.width / 2
        button.layer.shadowOpacity = 0.25
        button.layer.shadowRadius = 5
        button.layer.shadowOffset = CGSize.init(width: 0, height: 10)
    }
    
    private func loadSampleTasks(){
         
        //init tasks
        let task1 = Task.init(taskName: "Feed the Cat Who we Named Mittens After my Dead Hamster", taskDescription: "Mittens eats one cup of kibble a day", taskColor: UIColor.systemRed)
        let task2 = Task.init(taskName: "Do Homework", taskDescription: "Do sections one and two from algebra", taskColor: UIColor.systemBlue)
        let task3 = Task.init(taskName: "Dinner with Dan", taskDescription:
            "Reservation is at 8:00pm, pickup Daniel at 7:50pm, Restaurant is located at 51 Fake Dr. Bring suit and tie!", taskColor: UIColor.systemGreen)
        
        tasks.append(task1!)
        tasks.append(task2!)
        tasks.append(task3!)
    }
    
    //MARK: TableView Functions
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TaskTableViewCell else{
            fatalError("Dequeued cell is not of type TaskTableViewCell")
        }
        
        let task = tasks[indexPath.row]
        
        cell.taskTitle.text = task.taskName
        cell.taskDescription.text = task.taskDescription
        cell.taskColor.backgroundColor = task.taskColor
        
        return cell
    }
}
