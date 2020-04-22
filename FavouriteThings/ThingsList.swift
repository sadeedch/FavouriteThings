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

class ThingsList: ObservableObject, Identifiable {
   @Published var things: [Things] = []

}
