//
//  ToDoListTableViewController.swift
//  ListadeTarefas
//
//  Created by Rafaella Rodrigues Santos on 12/10/23.
//

import UIKit

class ToDoListTableViewController: UITableViewController {
    
    var tasks: [String] = []
    let key = "listaTarefas"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func upDateTask() {
        let task = TaskUserDefaults()
        tasks = task.list(key: key)
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        upDateTask()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath)
        
        cell.textLabel?.text = tasks[indexPath.row]
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            let task = TaskUserDefaults()
            task.remove(indice: indexPath.row, key: key)
            upDateTask()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //if segue.identifier == "segue" {
            if let cellNumber = sender as? Int {
                if let viewController = segue.destination as? DetailsViewController {
                    viewController.index = cellNumber
                }

            }

        //}
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellNumber = indexPath.row
        performSegue(withIdentifier: "segue", sender: cellNumber)
    }

    
}
