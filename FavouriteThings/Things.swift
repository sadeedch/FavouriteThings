//
//  Things.swift
//  FavouriteThings
//
//  Created by Sadeed Ahmed  on 22/4/20.
//  Copyright © 2020 Sadeed Ahmad. All rights reserved.
//

import Foundation
import SwiftUI

class Things: ObservableObject, Identifiable {
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
    
    // initilizer of the Ground class.
    init(_ groundURL: String,_ groundName: String, _ groundLocation: String, _ groundCapacity: String, _ groundOpened: String, _ groundOwner: String, _ groundNotes: String) {
        url = groundURL
        name = groundName
        location = groundLocation
        capacity = groundCapacity
        opened = groundOpened
        owner = groundOwner
        notes = groundNotes
        
    }
}
