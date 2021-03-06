//
//  ViewController.swift
//  organizer_app
//
//  Created by User on 2020-09-01.
//  Copyright © 2020 aaronhertner. All rights reserved.
//

import UIKit
import os.log

class TaskViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    //MARK: Properties
    var task: Task? = nil      //used for sending filled task data to table view
    
    //MARK: Outlets
    @IBOutlet weak var taskLabel : UILabel!                     //task label
    @IBOutlet weak var taskNameTextField : UITextField!         //text field for task name
    @IBOutlet weak var taskDetailsTextField: UITextView!       //text field for task details
    @IBOutlet weak var taskColorPicker: ColorPickerControl!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    //MARK: Actions
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
            owningNavigationController.setNavigationBarHidden(true, animated: false)    //hide navigation bar
            owningNavigationController.popViewController(animated: true)                //return to task list
        }
        
        else{
            fatalError("TaskViewController is not inside a navigation controller")
        }
    }
    
    //MARK: UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        taskNameTextField.delegate = self
        taskDetailsTextField.delegate = self
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        //clear text fields enabled
        taskNameTextField.clearsOnBeginEditing = true
        
        /*
         check if task property is non nil
         if it is not, then we prepare for editing details
         */
        if let task = task{
            taskLabel.text = "Edit Task"
            taskNameTextField.text = task.taskName
            taskDetailsTextField.text = task.taskDescription
            taskDetailsTextField.textColor = UIColor.black
            taskColorPicker.selectedColor = task.taskColor
        }
    }
    
    //MARK: UITextViewDelegate
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
        textView.textColor = UIColor.black
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        taskNameTextField.resignFirstResponder()    //hides keyboard when return key pressed
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField){
    }

    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        //check that the button pressed was 'save'
        guard let button = sender as? UIBarButtonItem, button === saveButton else{
            os_log("Save button not pressed, cancelling", log: OSLog.default, type: .debug)
            return 
        }
        
        let title = taskNameTextField.text
        let details = taskDetailsTextField.text
        let color = taskColorPicker.selectedColor
        
        //init task object with selected values
        task = Task.init(taskName: title!, taskDescription: details!, taskColor: color!)
    }
}

