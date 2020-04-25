//
//  DetailView.swift
//  FavouriteThings
//
//  Created by Sadeed Ahmed  on 23/4/20.
//  Copyright © 2020 Sadeed Ahmad. All rights reserved.
//

import Foundation
import SwiftUI



// This Detail View shows the details of all the ground including its different properties.
struct DetailView: View {
    @ObservedObject public var ground: Things    //Singular instance of ground containing data
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.editMode) var mode
    @State var tempImageURL: String = ""         // tempImageURL : a temporary variable to hold the url of image entered by user
    var body: some View {
        
        VStack() {               // all the Ground data shown in this view is included in this Vertical Stack.
            
            VStack(alignment: .leading) {  // This vertical stack shows the Text Field to enter the notes
                Text("Notes:")
                    .fontWeight(.bold)
                    .font(Font.system(size: 20))
                //  text field to enter the notes and the entered text is bounded to ground.notes
                TextField("Enter your notes...", text: $ground.notes)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.frame(width: 350, height: nil)
            
            
            VStack(alignment: .leading) {  // This vertical stack shows the image and Text Field to enter url for a new image
                Text("Image URL:")
                    .fontWeight(.bold)
                    .font(Font.system(size: 20))
                /*  text field to enter the url of new image for a ground and the entered url is bounded to $tempImageURL.
                    this temporary value is then sent to the url property of class ground. */
                TextField("Pase the image URL here", text: $tempImageURL, onCommit: { self.ground.url = self.tempImageURL
                    }).textFieldStyle(RoundedBorderTextFieldStyle())
                
                // (ground.image) shows the image of each ground
                (ground.image).resizable().frame(width: 360, height: 300)
            }.frame(width: 350, height: nil)
            
           
        
            // Vertical Stack to show the Ground name and location.
            VStack() {
                
                TextField("Ground name...", text: $ground.name)
                    .font(.largeTitle)
                
                TextField("Ground location...", text: $ground.location)
                    .font(.subheadline)
                    .padding(.bottom)
                    
                 }.frame(width: 300, alignment: .leading)
            
            
            
            VStack(){
                HStack {                    // Horizontal stack to show the capcaity of a ground
                    Text("Capacity:")
                        .fontWeight(.heavy)
                    TextField("Ground capacity...", text: $ground.capacity)
                    }
                HStack {                    // Horizontal stack to show the opening date of a ground
                    Text("Opened:")
                        .fontWeight(.heavy)
                    TextField("Ground opening date...", text: $ground.opened)
                    }
                HStack {                    // Horizontal stack to show the owner of a ground
                    Text("Owner:")
                        .fontWeight(.heavy)
                    TextField("Ground owner...", text: $ground.owner)
                    }
            }.frame(width: 300, alignment: .leading)
        }
    }
}

