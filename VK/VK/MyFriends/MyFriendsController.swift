//
//  MyFriendsController.swift
//  VK
//
//  Created by  Admin on 07.10.2024.
//

import UIKit

protocol MyFriendsViewProtocol: AnyObject {
    func getPhotoFromUrl(_ url: String) -> UIImage?
}

class MyFriendsViewController: UITableViewController {
    
    var presenter: MyFriendsPresenterProtocol?
    let module = MyFriendsModule()
    var users = [User]()

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
        return users.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyFriend", for: indexPath) as! MyFriendsCell
        let friend = users[indexPath.row]
        cell.friendName.text = friend.firstName + " " + friend.lastName
        //загрузка аватара из url
        cell.friendAvatar.image = getPhotoFromUrl(friend.photo)
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAvatar" {
            let photosViewController = segue.destination as! PhotosViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                photosViewController.idFriend = users[indexPath.row].id
                
            }
        }
    }
}

extension MyFriendsViewController: MyFriendsViewProtocol {
    func getPhotoFromUrl(_ url: String) -> UIImage? {
        if let photoURL:URL = URL(string: url), let photoData = try? Data(contentsOf: photoURL) {
            return UIImage(data: photoData)
        }
        return nil
    }
}
