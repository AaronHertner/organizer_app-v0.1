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
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

}
