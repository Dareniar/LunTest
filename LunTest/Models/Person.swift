//
//  Person.swift
//  LunTest
//
//  Created by Danil Shchegol on 3/22/19.
//  Copyright © 2019 Danil Shchegol. All rights reserved.
//

import Foundation

struct Person: Decodable {
    let person_id: Int
    let name: String
    let address: String
    let phone: String
    let profile_image_id: Int
    let lat: Double
    let lng: Double
}
