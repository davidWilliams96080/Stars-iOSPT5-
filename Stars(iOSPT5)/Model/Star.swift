//
//  Star.swift
//  Stars(iOSPT5)
//
//  Created by David Williams on 2/13/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import Foundation

struct Star: Codable {
    var name: String
    var distance: Double
    
    var distanceDescription: String {
        return "\(distance) light years away!"
    }
}
