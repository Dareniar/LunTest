//
//  PersonWithImages.swift
//  LunTest
//
//  Created by Danil Shchegol on 3/22/19.
//  Copyright © 2019 Danil Shchegol. All rights reserved.
//

import Foundation

struct PersonWithImages: Decodable {
    
    let person: Person
    let images: [Image]
    
    //failable init that creates instance of structure if json has decoded from file successfully, otherwise returns nil
    init?() {
        if let path = Bundle.main.path(forResource: "lun", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                do {
                    self = try JSONDecoder().decode(PersonWithImages.self, from: data)
                } catch {
                    print(error)
                    return nil
                }
            } catch {
                print(error)
                return nil
            }
        } else {
            return nil
        }
    }
}
