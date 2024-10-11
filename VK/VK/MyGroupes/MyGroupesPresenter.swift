//
//  MyGroupesPresenter.swift
//  VK
//
//  Created by Inna on 11.10.2024.
//

import Foundation

protocol MyGroupesPresenterProtocol: AnyObject {
    func viewDidLoaded()
}

class MyGroupesPresenter {
    weak var view: MyGroupesViewController?
    var router: MyGroupesRouterProtocol
    var interactor: MyGroupesInteractorProtocol
      
    init(interactor: MyGroupesInteractorProtocol, router: MyGroupesRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension MyGroupesPresenter: MyGroupesPresenterProtocol {
    
    func viewDidLoaded() {
    
    }
}
    
