//
//  TaskTableViewCell.swift
//  organizer_app
//
//  Created by User on 2020-09-05.
//  Copyright © 2020 aaronhertner. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var taskTitle : UILabel!
    @IBOutlet weak var taskDescription : UITextView!
    @IBOutlet weak var taskColor : UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
