//
//  MyGroupesController.swift
//  VK
//
//  Created by  Admin on 07.10.2024.
//

import UIKit

protocol MyGroupesViewProtocol: AnyObject {
    
}

class MyGroupesViewController: UITableViewController {
    var presenter: MyGroupesPresenter?
    let module = MyGroupesModule()
    
    var groups = [String]()
    var avatars = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        module.build(with: self)
        presenter?.viewDidLoaded()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groups.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupCell", for: indexPath) as! MyGroupesCell
        
        let group = groups[indexPath.row]
        cell.groupName.text = group
        cell.groupAvatar.image = UIImage(named: avatars[indexPath.row])
        return cell
    }
    
    // добавление группы
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        if segue.identifier == "addGroup" {
            let allGroupesViewController = segue.source as! AllGroupesViewController
            if let indexPath = allGroupesViewController.tableView.indexPathForSelectedRow {
                let group = allGroupesViewController.groupes[indexPath.row][1]
                let avatar = allGroupesViewController.groupes[indexPath.row][0]
                // проверка, что этой группы еще нет в списке
                if !groups.contains(group) {
                    groups.append(group)
                    avatars.append(avatar)
                    tableView.reloadData()
                }
            }
        }
    }
    
    // Удаление группы
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groups.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension MyGroupesViewController: MyGroupesViewProtocol {
    
}
