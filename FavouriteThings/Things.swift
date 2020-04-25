//
//  Things.swift
//  FavouriteThings
//
//  Created by Sadeed Ahmed  on 22/4/20.
//  Copyright © 2020 Sadeed Ahmad. All rights reserved.
//


import Foundation
import SwiftUI

/// This class is a type to represent a particular thing in the favourite things collection

class Things: ObservableObject, Identifiable, Codable {
    
    @Published var url: String?              // String which may have the url to download the ground image.s
    var image: Image {
        if let img = url {
        // it tries to download the image from the url by applying downloadedImage function specified in the Image.swift file.
            return downloadedImage(img)
        }
        else {
           return Image("default")  // returns the default image if image can not be downloaded
        }
    }
    
    @Published var name: String             // String containing the name of the ground
    @Published var location: String         // String containing the location of the ground
    @Published var capacity: String         // String containing the capacity of the ground
    @Published var opened: String           // String containing the opened date of the ground
    @Published var owner: String            // String containing the owner of the ground
    @Published var notes: String            // String containing the notes of the ground
   
    
    
    // The keys for JSON encoding
    enum CodingKeys : String, CodingKey {
        case url
        case name
        case location
        case capacity
        case opened
        case owner
        case notes
        
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.url = try container.decode(String.self, forKey: .url)
        self.name = try container.decode(String.self, forKey: .name)
        self.location = try container.decode(String.self, forKey: .location)
        self.capacity = try container.decode(String.self, forKey: .capacity)
        self.opened = try container.decode(String.self, forKey: .opened)
        self.owner = try container.decode(String.self, forKey: .owner)
        self.notes = try container.decode(String.self, forKey: .notes)
    }
    
    func encode (to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(url, forKey: .url)
        try container.encode(name, forKey: .name)
        try container.encode(location, forKey: .location)
        try container.encode(capacity, forKey: .capacity)
        try container.encode(opened, forKey: .opened)
        try container.encode(owner, forKey: .owner)
        try container.encode(notes, forKey: .notes)
    }
    
    // initilizer of the Ground class.
   
    
    init() {
        url = ""
        name = ""
        location = ""
        capacity = ""
        opened = ""
        owner = ""
        notes = ""

    }

}
