//
//  MasterView.swift
//  FavouriteThings
//
//  Created by Sadeed Ahmed  on 23/4/20.
//  Copyright © 2020 Sadeed Ahmad. All rights reserved.
//

import Foundation
import SwiftUI

/// master view with image name and lcation of grounds.
struct MasterView: View {
    @ObservedObject var thingsList: ThingsList
    @Environment(\.editMode) var mode
    var body: some View {
        VStack {
            // specifying the action if the edit mode is selected
            if mode?.wrappedValue == .active {
                HStack {
                    Text("✏️").font(Font.system(.largeTitle).bold())
                    TextField("Enter Title", text: $thingsList.title).font(Font.system(.largeTitle).bold())
                }
            }
           
            List {
                ForEach(thingsList.things) { i in  // this loop iterate through list of all the grounds
                    //destination will take to detailview after clicking on a ground
                    NavigationLink (destination: DetailView(things: i)){
                            RowView(thingsRow: i)
                    }
                //onDelete specifying the action to delete a particualr item
                }.onDelete {indices in indices.forEach { self.thingsList.things.remove(at: $0) }}
                .onMove(perform: move)  // specifying the action to re-arrange an item in the list by using move function
            }
        }.navigationBarTitle(mode?.wrappedValue == .active ?  "" : thingsList.title)
    }
    
    /// function move to re-arrange an item in the list
    func move (from source: IndexSet, to destination: Int){
        thingsList.things.move(fromOffsets: source, toOffset: destination)
        
    }
}
