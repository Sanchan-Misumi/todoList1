//
//  ViewController.swift
//  ToDoList
//
//  Created by Maho Misumi on 2018/03/04.
//  Copyright © 2018年 Maho Misumi. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    var todoItem = [String]()
    var saveData:UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        table.dataSource = self
        table.delegate = self
        todoItem = ["おはよう"]
        print(todoItem)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section :Int) -> Int {
        return todoItem.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = todoItem[indexPath.row]
        
        return cell!
    }
    
    func performSegueToResult(){
        performSegue(withIdentifier: "toTodoView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTodoView"{
            let todoViewController = segue.destination as! todoViewController
            todoViewController.todoItem = self.todoItem
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        performSegueToResult()
    }
    


}

