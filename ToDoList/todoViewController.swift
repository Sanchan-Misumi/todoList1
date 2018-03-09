//
//  todoViewController.swift
//  ToDoList
//
//  Created by Maho Misumi on 2018/03/04.
//  Copyright © 2018年 Maho Misumi. All rights reserved.
//

import UIKit

class todoViewController: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet var itemText: UITextField!
    var todoItem = [String]()
    var saveData:UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        itemText.delegate = self
        itemText.text = saveData.object(forKey: "todo") as? String
        print(todoItem)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func save(){
        todoItem.append(itemText.text!)
        saveData.set(todoItem, forKey:"todo")
        saveData.synchronize()
        
        self.navigationController?.popViewController(animated: true)
        print(todoItem)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
