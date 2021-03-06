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
    @ObservedObject var things: Things    //Singular instance of things containing data
    @Environment(\.managedObjectContext) var context 
    @State var tempImageURL: String = ""      // tempImageURL : a temporary variable to hold the url of image entered by user
    var body: some View {
        
        VStack() {               // all the Things data shown in this view is included in this Vertical Stack.
            
            VStack(alignment: .leading) {  // This vertical stack shows the Text Field to enter the notes
                Text("Notes:")
                    .fontWeight(.bold)
                    .font(Font.system(size: 20))
                //  text field to enter the notes and the entered text is bounded to things.notes
                TextField("Enter your notes...", text: $things.notes)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }.frame(width: 350, height: nil)
            
            
            VStack(alignment: .leading) {  // This vertical stack shows the image and Text Field to enter url for a new image
                Text("Image URL:")
                    .fontWeight(.bold)
                    .font(Font.system(size: 20))
                /*  text field to enter the url of new image for a thing and the entered url is bounded to $tempImageURL.
                    this temporary value is then sent to the url property of class things. */
                TextField("Paste the image URL here", text: $tempImageURL, onCommit: { self.things.url = self.tempImageURL
                    }).textFieldStyle(RoundedBorderTextFieldStyle())
                
                // (things.image) shows the image of each ground
                (things.image).resizable().frame(width: 360, height: 300)
            }.frame(width: 350, height: nil)
            
           
        
            // Vertical Stack to show the Ground name and location.
            VStack() {
                
                TextField("Item name...", text: $things.name)
                    .font(.largeTitle)
                
                TextField("Location...", text: $things.location)
                    .font(.subheadline)
                    .padding(.bottom)
                    
                 }.frame(width: 300, alignment: .leading)
            
            
            
            VStack(){
                // Showing the title field of capcaity of a ground and its value. Both the fields are editable.
                HStack {
                    TextField("Capacity..", text: $things.title_field1)
                    TextField("Enter capacity...", text: $things.capacity)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                // Showing the title field of opening date of a ground and its value. Both the fields are editable.
                HStack {
                    TextField("Opened..", text: $things.title_field2)
                    TextField("Enter opening date...", text: $things.opened)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                // Showing the title field of owner name of a ground and its value. Both the fields are editable.
                HStack {
                    TextField("Owner..", text: $things.title_field3)
                    TextField("Enter owner", text: $things.owner)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }.frame(width: 300, alignment: .leading)
        }
    }
}

