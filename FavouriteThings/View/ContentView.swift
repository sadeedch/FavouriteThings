//
//  ContentView.swift
//  FavouriteThings
//
//  Created by Sadeed Ahmed  on 22/4/20.
//  Copyright © 2020 Sadeed Ahmad. All rights reserved.
//

import SwiftUI



/// content view to display the MasterView to be displayed
struct ContentView: View {
    @ObservedObject var thingsList = ThingsList()
    var body: some View {
       NavigationView {
        MasterView(thingsList: thingsList)
           
            /*  leading: EditButton() - specifies the edit button in the navigation bar on the left side
                trailing: Button(action) - specifies the add button in the navigation bar on the right side
                If the user clicks on add button, then it appends the ground array to add a new ground entry which is specified
                in action. */
            .navigationBarItems(leading: EditButton(),
            trailing: Button( action: {
                  withAnimation { self.thingsList.things.append(Things("","Name", "Loaction","","","","", "", "", "" )) }
            }){ Image(systemName: "plus")})
        }
    }
}

