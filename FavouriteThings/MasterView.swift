//
//  MasterView.swift
//  FavouriteThings
//
//  Created by Sadeed Ahmed  on 23/4/20.
//  Copyright © 2020 Sadeed Ahmad. All rights reserved.
//

import Foundation
import SwiftUI

// master view with image name and lcation of grounds
struct MasterView: View {
    @ObservedObject var groundList: ThingsList
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.editMode) var mode
    var body: some View {
        List {
            ForEach(groundList.things) { i in  // this loop iterate through list of all the grounds
                //destination will take to detailview after clicking on a ground
                NavigationLink (destination: DetailView(ground: i)){
                        RowView(groundRow: i)
                }
            }.onDelete {indices in indices.forEach { self.groundList.things.remove(at: $0) }}
        }
    }
}
