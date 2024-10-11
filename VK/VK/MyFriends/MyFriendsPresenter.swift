//
//  MyFriendsPresenter.swift
//  VK
//
//  Created by Inna on 11.10.2024.
//

import Foundation

protocol MyFriendsPresenterProtocol: AnyObject {
    func viewDidLoaded()
    func friendsDidLoaded(friends: [User])
}

class MyFriendsPresenter {
    weak var view: MyFriendsViewController?
    var router: MyFriendsRouterProtocol
    var interactor: MyFriendsInteractorProtocol
   
    init(interactor: MyFriendsInteractorProtocol, router: MyFriendsRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension MyFriendsPresenter: MyFriendsPresenterProtocol {
   
    func viewDidLoaded() {
        interactor.loadFriends()
    }
    
    func friendsDidLoaded(friends: [User]) {
        view?.users = friends
        view?.tableView?.reloadData()
    }
    
    
}
