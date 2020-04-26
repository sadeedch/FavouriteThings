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
    @ObservedObject var thingsRow: Things
    var body: some View {
        // This horizontal stack contains the Ground image, Ground name and its location.
        HStack {
            (thingsRow.image).resizable().frame(width: 120, height: 120)    //  shows the ground image
            Text(self.thingsRow.name).bold()                                //  shows the ground name
            Text(self.thingsRow.location)                                   //  shows the ground location
        }
    }
}
