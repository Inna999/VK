//
//  PhotosPresenter.swift
//  VK
//
//  Created by Inna on 10.10.2024.
//

import Foundation

protocol PhotosPresenterProtocol: AnyObject {
    func viewDidLoaded()
    func photosDidLoaded(photos: [Photo])
}

class PhotosPresenter {
    weak var view: PhotosViewController?
    var router: PhotosRouterProtocol
    var interactor: PhotosInteractorProtocol
    
    init(interactor: PhotosInteractorProtocol, router: PhotosRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension PhotosPresenter: PhotosPresenterProtocol {
   
    func viewDidLoaded() {
        guard let idFriend = view?.idFriend, idFriend != 0 else { return }
        interactor.loadPhotos(idFriend: idFriend)
    }
    
    func photosDidLoaded(photos: [Photo]) {
        view?.photos = photos
        view?.collectionView.reloadData()
    }
    
    
}
