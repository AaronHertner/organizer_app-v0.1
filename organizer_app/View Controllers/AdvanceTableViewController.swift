//
//  AdvanceTableViewController.swift
//  organizer_app
//
//  Created by User on 2020-09-13.
//  Copyright © 2020 aaronhertner. All rights reserved.
//

import UIKit

class AdvanceTableViewController: UIViewController, UITableViewDataSource {
    
    //MARK: Properties
    var tasks = [Task]()
    
    //MARK: Outlets
    @IBOutlet weak var taskTableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    //MARK: Actions
    //save function called on exit from segue
    @IBAction func unwindToTaskList(sender: UIStoryboardSegue){
        
        //check that the previous controller was a taskViewController
        if let sourceViewController = sender.source as? TaskViewController, let task = sourceViewController.task{
            let indexPath = IndexPath(row: tasks.count, section: 0)
            tasks.append(task)
            taskTableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    //MARK: UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTableView.dataSource = self
        loadSampleTasks()
        
        //stylize add button
        addButton.backgroundColor = AppDelegate.primaryColor
        addButton.layer.cornerRadius = addButton.frame.width / 2
        addButton.layer.shadowOpacity = 0.25
        addButton.layer.shadowRadius = 5
        addButton.layer.shadowOffset = CGSize.init(width: 0, height: 10)
        
    }
    
    //MARK: Private Functions
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
