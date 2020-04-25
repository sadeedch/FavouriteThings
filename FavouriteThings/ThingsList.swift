//
//  ThingsList.swift
//  FavouriteThings
//
//  Created by Sadeed Ahmed  on 22/4/20.
//  Copyright © 2020 Sadeed Ahmad. All rights reserved.
//

import Foundation

//class GroundList extends class Ground by having an array of grounds
import SwiftUI

class ThingsList: ObservableObject, Identifiable, Codable {
    @Published var things:  [Things]
    @Published var title: String
    
    
    enum CodingKeys : String, CodingKey {
              case things
              case title
              
          }
    init() {
        things = [Things]()
        title = "Favourite Things"
    }
    
   
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.things = try container.decode([Things].self, forKey: .things)
        self.title = try container.decode(String.self, forKey: .title)
    }
    
    func encode (to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(things, forKey: .things)
        try container.encode(title, forKey: .title)
    }
    
    

}
