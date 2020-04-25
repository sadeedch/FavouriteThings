//
//  RowView.swift
//  FavouriteThings
//
//  Created by Sadeed Ahmed  on 23/4/20.
//  Copyright © 2020 Sadeed Ahmad. All rights reserved.
//

import Foundation

import SwiftUI

// RowView is an extracted view from the master view. It shows the image, name and location of each ground in a list.
struct RowView: View {
    @ObservedObject var groundRow: Things
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.editMode) var mode
    var body: some View {
        
        // This horizontal stack contains the Ground image, Ground name and its location.
        HStack {
            (groundRow.image).resizable().frame(width: 120, height: 120)    //  shows the ground image
            Text(self.groundRow.name).bold()                                //  shows the ground name
            Text(self.groundRow.location)                                   //  shows the ground location
        }
    }
}
