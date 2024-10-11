//
//  MyFriendsInteractor.swift
//  VK
//
//  Created by Inna on 11.10.2024.
//

import Foundation

protocol MyFriendsInteractorProtocol: AnyObject {
    func loadFriends()
}

class MyFriendsInteractor: MyFriendsInteractorProtocol {
    weak var presenter: MyFriendsPresenterProtocol?

    func loadFriends() {
        let info = VkApiServise()
        //запрос списка друзей
        info.getInfoFromVK(params: ["fields" : ["first_name", "last_name", "photo_100"], "count": 10]) {
            [weak self] users in
            self?.presenter?.friendsDidLoaded(friends: users as! [User])
        }
    }
}

