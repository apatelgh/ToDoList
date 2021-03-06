//
//  AddToDoViewController.swift
//  ToDo List
//
//  Created by Anil Patel on 10/05/2018.
//  Copyright © 2018 Anil Patel. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {
    
    var previousVC = ToDoTableViewController()
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addTapped(_ sender: Any) {
/*
        let toDo = ToDo()
        
        if let titleText = titleTextField.text {
            toDo.name = titleText
            toDo.important = importantSwitch.isOn
            
            previousVC.toDos.append(toDo)
            previousVC.tableView.reloadData()
            
            navigationController?.popViewController(animated: true)
        }
 */
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
        
            
            if let titleText = titleTextField.text {
                if titleText != "" {
                    
                let toDo = ToDoCoreData(entity: ToDoCoreData.entity(), insertInto: context)
 
                toDo.name = titleText
                    toDo.important = importantSwitch.isOn
                }
            }
           
            try? context.save()
            
            navigationController?.popViewController(animated: true)
        }
        
   }
    
}
