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
        things = [Things("https://www.abc.net.au/news/image/5175326-3x2-940x627.jpg","MCG","Melbourne", "100024", "1853", "Melbourne Cricket Club", "", "Capacity", "Opened", "Owner"), Things("https://assets.atdw-online.com.au/images/58eb0e41d72e0aa26d1b765a8447629f.jpeg?rect=127%2c0%2c2053%2c1540&w=1200","Gabba","Brisbane", "42000", "1895", "Stadiums QLD", "", "Capacity", "Opened", "Owner"),
            Things("https://www.austadiums.com/stadiums/photos/Sydney-Cricket-Ground.jpg","SCG","Sydney", "48601","1848","Sydney Cricket Ground Trust", "","Capacity", "Opened", "Owner")]
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
