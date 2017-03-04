//
//  AddItemController.swift
//  CheckLists
//
//  Created by 吴童 on 2017/3/4.
//  Copyright © 2017年 吴童. All rights reserved.
//
import UIKit

protocol AddItemViewControllerDelegate: class {
    func addItemViewControllerDidCancel(_ controller: AddItemViewController)
    func addItemViewController(_ controller: AddItemViewController, didFinishAdding item: ChecklistItem)
}

class AddItemViewController: UITableViewController, UITextFieldDelegate {
    weak var delegate: AddItemViewControllerDelegate?
    
    @IBAction func cancel() {
        print("self cancel")
        delegate?.addItemViewControllerDidCancel(self)
    }
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    @IBAction func done() {
//        print("Contents of the text field:\(textField.text!)")
        let item = ChecklistItem()
        item.text = textField.text!
        item.isChecked = false
        
        delegate?.addItemViewController(self, didFinishAdding: item)
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text! as NSString
        let newText = oldText.replacingCharacters(in: range, with: string)
        
        if newText.characters.count > 0 {
            doneBarButton.isEnabled = true
        }else {
            doneBarButton.isEnabled = false
        }
        
        return true
    }
}
