//
//  User.swift
//  VK
//
//  Created by Inna on 10.10.2024.
//

import Foundation
import SwiftyJSON

class User {
    var id = 0
    var firstName = ""
    var lastName = ""
    var photo = ""

    init(json: JSON) {
        id = json["id"].intValue
        firstName = json["first_name"].stringValue
        lastName = json["last_name"].stringValue
        photo = json["photo_100"].stringValue
    }
}
