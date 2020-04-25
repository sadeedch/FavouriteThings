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
    @ObservedObject var thingsList: ThingsList
    @Environment(\.editMode) var mode
    var body: some View {
        VStack {
            if mode?.wrappedValue == .active {
            HStack {
                Text("✏️").font(Font.system(.largeTitle).bold())
                TextField("Enter Title", text: $thingsList.title).font(Font.system(.largeTitle).bold())
                }
            }
           
            List {
                ForEach(thingsList.things) { i in  // this loop iterate through list of all the grounds
                    //destination will take to detailview after clicking on a ground
                    NavigationLink (destination: DetailView(ground: i)){
                            RowView(thingsRow: i)
                    }
                }.onDelete {indices in indices.forEach { self.thingsList.things.remove(at: $0) }}
                .onMove(perform: move)
            }
        } .navigationBarTitle(mode?.wrappedValue == .active ?  "" : thingsList.title)
    }
    func move (from source: IndexSet, to destination: Int){
        thingsList.things.move(fromOffsets: source, toOffset: destination)
        
    }
}
