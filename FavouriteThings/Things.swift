////
////  Things.swift
////  FavouriteThings
////
////  Created by Sadeed Ahmed  on 22/4/20.
////  Copyright © 2020 Sadeed Ahmad. All rights reserved.
////
//
//
//import Foundation
//import SwiftUI
//
///// This class is a type to represent a particular thing in the favourite things collection.
///// It includes image, name, location, capacity, opening date, owner, notes and 3 text fields
//class Things: ObservableObject, Identifiable, Codable {
//    
//    // String which may have the url to download the thing image.
//    @Published var url: String?
//    var image: Image {
//        if let img = url {
//        // it tries to download the image from the url by applying downloadedImage function specified in the Image.swift file.
//            return downloadedImage(img)
//        }
//        else {
//           return Image("default")  // returns the default image if image can not be downloaded
//        }
//    }
//    
//    @Published var name: String             // String containing the name of the ground
//    @Published var location: String         // String containing the location of the ground
//    @Published var capacity: String         // String containing the capacity of the ground
//    @Published var opened: String           // String containing the opened date of the ground
//    @Published var owner: String            // String containing the owner of the ground
//    @Published var notes: String            // String containing the notes of the ground
//    @Published var title_field1: String     // String containing the text_field1  of the ground
//    @Published var title_field2: String     // String containing the text_field2  of the ground
//    @Published var title_field3: String     // String containing the text_field3  of the ground
//    
//    
//    /// The keys for JSON encoding and decoding
//    enum CodingKeys : String, CodingKey {
//        case url
//        case name
//        case location
//        case capacity
//        case opened
//        case owner
//        case notes
//        case title_field1
//        case title_field2
//        case title_field3
//    }
//    
//    
//    /// initilizer of the Things class.
//    /// - Parameters:
//    ///   - groundURL: url of the ground image (String)
//    ///   - groundName: name of a particualr ground (String)
//    ///   - groundLocation: location of a ground (String)
//    ///   - groundCapacity: capacity of a ground (String)
//    ///   - groundOpened: opening date of a ground (String)
//    ///   - groundOwner: owner of the ground (String)
//    ///   - groundNotes: notes for a particular ground (String)
//    ///   - groundTitle_Field1: title field 1 for a ground (String)
//    ///   - groundTitle_Field2: title field 2 for a ground (String)
//    ///   - groundTitle_Field3: title field 3 for a ground (String)
//    init(_ groundURL: String,_ groundName: String, _ groundLocation: String, _ groundCapacity: String, _ groundOpened: String, _ groundOwner: String, _ groundNotes: String, _ groundTitle_Field1: String,_ groundTitle_Field2: String,_ groundTitle_Field3: String ) {
//           url = groundURL
//           name = groundName
//           location = groundLocation
//           capacity = groundCapacity
//           opened = groundOpened
//           owner = groundOwner
//           notes = groundNotes
//           title_field1 = groundTitle_Field1
//           title_field2 = groundTitle_Field2
//           title_field3 = groundTitle_Field3
//    }
//    
//    /// Decoding the data
//    /// - Parameter decoder: object decoder being used to decode the data
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.url = try container.decode(String.self, forKey: .url)
//        self.name = try container.decode(String.self, forKey: .name)
//        self.location = try container.decode(String.self, forKey: .location)
//        self.capacity = try container.decode(String.self, forKey: .capacity)
//        self.opened = try container.decode(String.self, forKey: .opened)
//        self.owner = try container.decode(String.self, forKey: .owner)
//        self.notes = try container.decode(String.self, forKey: .notes)
//        self.title_field1 = try container.decode(String.self, forKey: .title_field1)
//        self.title_field2 = try container.decode(String.self, forKey: .title_field2)
//        self.title_field3 = try container.decode(String.self, forKey: .title_field3)
//    }
//    
//    /// Encoding the data
//    /// - Parameter encoder: object encoder being used to encode the data
//    func encode (to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(url, forKey: .url)
//        try container.encode(name, forKey: .name)
//        try container.encode(location, forKey: .location)
//        try container.encode(capacity, forKey: .capacity)
//        try container.encode(opened, forKey: .opened)
//        try container.encode(owner, forKey: .owner)
//        try container.encode(notes, forKey: .notes)
//        try container.encode(title_field1, forKey: .title_field1)
//        try container.encode(title_field2, forKey: .title_field2)
//        try container.encode(title_field3, forKey: .title_field3)
//    }
//}
