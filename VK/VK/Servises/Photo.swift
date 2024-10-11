//
//  Photo.swift
//  VK
//
//  Created by Inna on 10.10.2024.
//

import Foundation
import SwiftyJSON

class Photo {
    var photo = ""

    init(json: JSON) {
        photo = json["orig_photo"]["url"].stringValue
    }
}
