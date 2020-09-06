//
//  Task.swift
//  organizer_app
//
//  Created by User on 2020-09-06.
//  Copyright © 2020 aaronhertner. All rights reserved.
//

import Foundation
import UIKit

class Task
{
    //MARK: Properties
    var taskName: String
    var taskDescription: String
    var taskColor: UIColor?
    
    //MARK: Initializers
    init?(taskName: String, taskDescription: String, taskColor: UIColor){
        if(taskName.isEmpty || taskColor == nil){return nil}
        
        self.taskName = taskName
        self.taskDescription = taskDescription
        self.taskColor = taskColor
    }
}
