//
//  ViewController.swift
//  ToDoList
//
//  Created by Sarah Wooldridge on 12/3/18.
//  Copyright © 2018 Sarah Wooldridge. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddList, CheckedOff {
        
    func checkedOff(checked: Bool, index: Int?) {
        lists[index!].completed = checked
        tableView.reloadData()
    }
    
  
    
    func addList(name: String) {
        lists.append(List(name: name))
        tableView.reloadData()
    }
    

    
    @IBOutlet weak var tableView: UITableView!
    
    var lists: [List] = []

    override func viewDidLoad() {
       lists.append(List(name: "Complete All Task"))
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! ListCell
        
        cell.ToDo.text = lists[indexPath.row].name
        
        if lists[indexPath.row].completed {
            cell.CompletionBox.setBackgroundImage(#imageLiteral(resourceName: "CheckedImage"), for: UIControl.State.normal)
        } else {
            cell.CompletionBox.setBackgroundImage(#imageLiteral(resourceName: "unchecked"), for: UIControl.State.normal)
        }
        
        cell.delgate = self
        cell.IP = indexPath.row
        cell.lists = lists
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete
        {
            self.lists.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! AddListViewController
        viewController.delgate = self
    }
}

class List {
    
    var name = ""
    var completed = false
    
    convenience init (name: String){
        self.init()
        self.name = name
    }
}


