//
//  Bird.swift
//  AngryBirds
//
//  Created by Chelsea Troy on 4/13/20.
//  Copyright © 2020 Chelsea Troy. All rights reserved.
//

import Foundation

class Bird: Codable {

    var debugDescription: String {
        return "Bird(name: \(self.name), description: \(self.description))"
    }
    
    var name: String
    var description: String
    var imageUrl: String
    
    var confirmedSighting: Bool = false
    
    private enum CodingKeys: String, CodingKey {
        case name, description, imageUrl
    }
    
    init(named name: String, description: String, imageUrl: String) {
        self.name = name
        self.description = description
        self.imageUrl = imageUrl
    }
}

struct BirdResult: Codable {
    let birds: [Bird]
}
