//
//  ViewController.swift
//  CheckLists
//
//  Created by 吴童 on 2017/3/4.
//  Copyright © 2017年 吴童. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
//    var row0text = "walk the dog"
//    var row1text = "brush the teeth"
//    var row2text = "learn ios dev"
//    var row3text = "soccer practice"
//    var row4text = "eat ice-cream"
//    
//    var row0check = false
//    var row1check = false
//    var row2check = false
//    var row3check = false
//    var row4check = false
    
    var row0Item : ChecklistItem
    var row1Item : ChecklistItem
    var row2Item : ChecklistItem
    var row3Item : ChecklistItem
    var row4Item : ChecklistItem
    var items : [ChecklistItem]
    
    required init?(coder aDecoder: NSCoder) {
        items = [ChecklistItem]()
        
        row0Item = ChecklistItem()
        row0Item.text = "walk the dog"
        row0Item.isChecked = false
        items.append(row0Item)
        
        row1Item = ChecklistItem()
        row1Item.text = "brush the teeth"
        row1Item.isChecked = false
        items.append(row1Item)
        
        row2Item = ChecklistItem()
        row2Item.text = "learn ios dev"
        row2Item.isChecked = false
        items.append(row2Item)
        
        row3Item = ChecklistItem()
        row3Item.text = "soccer practice"
        row3Item.isChecked = false
        items.append(row3Item)
        
        row4Item = ChecklistItem()
        row4Item.text = "eat ice-cream"
        row4Item.isChecked = false
        items.append(row4Item)
        
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        let item = items[indexPath.row]
        
        configLabelText(for: cell, with: item)
        configCheckMark(for: cell, with: item)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            
            let item = items[indexPath.row]
            item.isChecked = !item.isChecked
            
            configCheckMark(for: cell, with: item)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func configCheckMark(for cell : UITableViewCell, with item : ChecklistItem) {
        if item.isChecked {
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
    }
    
    func configLabelText(for cell : UITableViewCell, with item : ChecklistItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        
        label.text = item.text
    }
    
    @IBAction func addItem() {
        let newRowIndex = items.count
        
        let item = ChecklistItem()
        item.text = "new row"
        item.isChecked = false
        items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
}

