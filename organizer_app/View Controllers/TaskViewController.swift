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
    let task: Task? = nil
    
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

    //MARK: Navigation
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        let presentingFromAdd = presentingViewController is UINavigationController
        
        /*
         depending on how the page was presented
         modally or pushed
         the page needs to receed accordingly
         */
        
        //scene arrived from add button
        if presentingFromAdd {
            dismiss(animated: true, completion: nil)
        }
        
        //removes scene from navigation stack
        else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        }
        
        else{
            fatalError("ShoeViewController is not inside a navigation controller")
        }
    }
}

