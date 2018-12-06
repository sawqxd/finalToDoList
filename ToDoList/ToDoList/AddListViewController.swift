//
//  AddListViewController.swift
//  ToDoList
//
//  Created by Sarah Wooldridge on 12/3/18.
//  Copyright © 2018 Sarah Wooldridge. All rights reserved.
//

import UIKit

protocol AddList {
    func addList(name: String)
}
class AddListViewController: UIViewController {

    
    @IBAction func addButton(_ sender: Any) {
        if AddList.text != "" {
            delgate?.addList(name: AddList.text!)
            navigationController?.popViewController(animated: true)
        }
        
    }
    
    
    @IBOutlet weak var AddList: UITextField!
    
    
    var delgate: AddList?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    

}
