//
//  ViewController.swift
//  organizer_app
//
//  Created by User on 2020-09-01.
//  Copyright © 2020 aaronhertner. All rights reserved.
//

import UIKit
import os.log

class TaskViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Outlets
    @IBOutlet weak var taskLabel : UILabel!                     //task label
    @IBOutlet weak var taskNameTextField : UITextField!         //text field for task name
    @IBOutlet weak var taskDetailsTextField: UITextField!
    
    //MARK: Properties
    let task: Task?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        taskNameTextField.delegate = self
        
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        taskNameTextField.resignFirstResponder()    //hides keyboard when return key pressed
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField){
        taskLabel.text = taskNameTextField.text
    }

}

