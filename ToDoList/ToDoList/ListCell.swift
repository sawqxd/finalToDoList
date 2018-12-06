//
//  ListCell.swift
//  ToDoList
//
//  Created by Sarah Wooldridge on 12/3/18.
//  Copyright © 2018 Sarah Wooldridge. All rights reserved.
//

import UIKit

protocol CheckedOff {
    func checkedOff(checked: Bool, index: Int?)
}
class ListCell: UITableViewCell {
    @IBAction func CompletionBoxAction(_ sender: Any) {
        if lists![IP!].completed {
            delgate?.checkedOff(checked: false, index: IP!)
        } else{
            delgate?.checkedOff(checked: true, index: IP!)

        }
        
    }
    
    @IBOutlet weak var CompletionBox: UIButton!
    @IBOutlet weak var ToDo: UILabel!
    
    var delgate: CheckedOff?
    var IP: Int?
    var lists: [List]?
    
    
}
