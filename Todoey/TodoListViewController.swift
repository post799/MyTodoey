//
//  ViewController.swift
//  Todoey
//
//  Created by First Last on 12/3/22.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = ["Find Mike","Buy Eggos","Destroy Demogoron"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(itemArray[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        //great job!
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new to do item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { action in
            // what will happen once user hits button
            self.itemArray.append(textField.text!)
            self.tableView.reloadData()
        }
        alert.addTextField{(alertTextfield) in
            alertTextfield.placeholder = "Create new item"
            textField = alertTextfield
        }
        alert.addAction(action)
        
        present(alert, animated: true)
    }
    
}

