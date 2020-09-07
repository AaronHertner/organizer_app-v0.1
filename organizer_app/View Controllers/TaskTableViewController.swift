//
//  TaskTableViewController.swift
//  organizer_app
//
//  Created by User on 2020-09-05.
//  Copyright © 2020 aaronhertner. All rights reserved.
//

import UIKit

class TaskTableViewController: UITableViewController {
    
    //MARK: Properties
    var tasks = [Task]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleTasks()
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
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }
    
    
    //used to configure cell data
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TaskTableViewCell else{
            fatalError("Dequeued cell is not an instance of TaskTableViewCell")
        }
        
        let task = tasks[indexPath.row]
        
        cell.taskTitle.text = task.taskName
        cell.taskDescription.text = task.taskDescription
        cell.taskColor.backgroundColor = task.taskColor
        
        return cell
    }

}
