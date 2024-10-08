//
//  VkApi.swift
//  VK
//
//  Created by Inna on 08.10.2024.
//

import Foundation
import UIKit
import Alamofire

class VkApi {
    let baseUrl = "https://api.vk.ru"
    
    func loadInfo(_ id: String = "8787657") {
        let path = "/method/users.getFollowers"
        let paramrters: Parameters = [
            "user_id": id,
            "v": "5.199",
            "access_token": "72d7484072d7484072d74840ae71f76080772d772d7484015d27328335bf436975da5b1"
        ]
        let url = baseUrl + path
        AF.request(url, method: .get, parameters: paramrters).responseJSON {
            response in
            print(response.value  ?? 0)
        }
    
    }
}
