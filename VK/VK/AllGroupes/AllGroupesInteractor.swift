//
//  AllGroupesInteractor.swift
//  VK
//
//  Created by Inna on 11.10.2024.
//

import Foundation

protocol AllGroupesInteractorProtocol: AnyObject {
    func getGroupes() -> [[String]]
}

class AllGroupesInteractor: AllGroupesInteractorProtocol {
    weak var presenter: AllGroupesPresenterProtocol?
    
    func getGroupes() -> [[String]] {
        let groupes = [
            ["1.png", "wqerty", "23434"],
            ["2.png", "group2", "989"],
            ["3.png", "asdfgh", "9"]
            ]
        return groupes
    }
}
