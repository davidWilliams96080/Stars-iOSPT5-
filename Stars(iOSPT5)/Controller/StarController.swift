//
//  File.swift
//  Stars(iOSPT5)
//
//  Created by David Williams on 2/13/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import Foundation

    
// Model Controller = Source of truth (Data)
// CRUD functions = Create, Read, Update, Delete objects
// Save, Load
    
// Access control -  the stars array can only be set from within StarContoller
    

class StarController {
    
   
    // private set means that "Stars" cab only be set by the star controller itself
private(set) var stars: [Star] = []

    
 // creating a URL or location on device to save to
private var persistentFileURL: URL? {
    // Singleton - Single instance that can be used througout the app
    let fileManager = FileManager.default
    guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
    // creating a .plist file - whatever name you want
    return documents.appendingPathComponent("stars.plist")
}

    init() {
           loadFromPersistentStore()
       }
// Create
// @discardableResult - You can call the function without doing anything with the return value
// Throw away the return value if not assigned to anything

    
    // CRUD
@discardableResult func createStar(named name: String, withDistance distance: Double) -> Star {
    let star = Star(name: name, distance: distance)
    stars.append(star)
    saveToPersistentStore()
    return star
}

// Save and Load functions
    func saveToPersistentStore() {
        
        // Star -> Data -> Plist
        guard let url = persistentFileURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(stars)
            try data.write(to: url)
        } catch {
            print("Error saving stars data: \(error)")
        }
    }

// Data in Plist -> Star
func loadFromPersistentStore() {
    //  Plist -> Data -> Star
    let fileManager = FileManager.default
    guard let url = persistentFileURL,
        fileManager.fileExists(atPath: url.path) else { return }
    do {
        let data =  try Data(contentsOf: url)
        let decoder = PropertyListDecoder()
        stars =  try decoder.decode([Star].self, from: data)
    } catch {
        print("Error loading stars data: \(error)")
    }
}
    
    func listStars() -> String {
        var output = ""
        for star in stars {
            output += "\(star.name) is \(star.distanceDescription).\n"
        }
        return output
    }
}

