//
//  PhotosInteractor.swift
//  VK
//
//  Created by Inna on 10.10.2024.
//

import Foundation

protocol PhotosInteractorProtocol: AnyObject {
    func loadPhotos(idFriend: Int)
}

class PhotosInteractor: PhotosInteractorProtocol {
    weak var presenter: PhotosPresenterProtocol?
    var idFriend: Int
    
    init(idFriend: Int) {
        self.idFriend = idFriend
    }
    
    func loadPhotos(idFriend: Int) {
        let info = VkApiServise()
        info.getInfoFromVK(for: String(idFriend), method: "photos.get", params: ["album_id" : -7, "count": 10]) {
            [weak self] photos in
            self?.presenter?.photosDidLoaded(photos: photos as! [Photo])
        }
    }
    
    
}

