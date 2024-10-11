//
//  AllGroupesController.swift
//  VK
//
//  Created by  Admin on 07.10.2024.
//

import UIKit

protocol AllGroupesViewProtocol: AnyObject {
    
}

class AllGroupesViewController: UITableViewController {
    var presenter: AllGroupesPresenter?
    let module = AllGroupesModule()
    
    @IBOutlet weak var searchBar: UISearchBar!
    var groupes = [[String]]()
    var searchedGroupes = [[String]]()
    var searching = false
    
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
        if searching {
            return searchedGroupes.count
        }
        return groupes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as! AllGroupesCell
        if searching {
            cell.groupName.text = searchedGroupes[indexPath.row][1]
            cell.followersCount.text = searchedGroupes[indexPath.row][2]
            cell.groupAvatar.image = UIImage(named: searchedGroupes[indexPath.row][0])
        } else {
            cell.groupName.text = groupes[indexPath.row][1]
            cell.followersCount.text = groupes[indexPath.row][2]
            cell.groupAvatar.image = UIImage(named: groupes[indexPath.row][0])
        }
        return cell
        
    }
}

extension AllGroupesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedGroupes = groupes.filter { $0[1].lowercased().prefix(searchText.count) == searchText.lowercased() }
        searching = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tableView.reloadData()
    }
}

extension AllGroupesViewController: AllGroupesViewProtocol {
    
}
