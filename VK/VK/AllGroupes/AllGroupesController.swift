//
//  AllGroupesController.swift
//  VK
//
//  Created by  Admin on 07.10.2024.
//

import UIKit

class AllGroupesController: UITableViewController {
    
    var groupes = [
        ["1.png", "wqerty", "23434"],
        ["2.png", "group2", "989"],
        ["3.png", "asdfgh", "9"]
        ]
//    var followers = ["123", "3456", "8878"]
//    var avatar = ["1.png", "2.png", "3.png"]

    @IBOutlet weak var searchBar: UISearchBar!
    
    var searchedGroupes = [[String]]()
  
    var searching = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
 
    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     }
     */
    

 

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AllGroupesController: UISearchBarDelegate {
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
