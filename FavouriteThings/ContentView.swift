//
//  ContentView.swift
//  FavouriteThings
//
//  Created by Sadeed Ahmed  on 22/4/20.
//  Copyright © 2020 Sadeed Ahmad. All rights reserved.
//

import SwiftUI

private let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    dateFormatter.timeStyle = .medium
    return dateFormatter
}()

struct ContentView: View {
    @State private var title = "Favourite Things List"
    @Environment(\.managedObjectContext)
    var viewContext
 
    var body: some View {
        NavigationView {
            MasterView(title: $title)
                
                .navigationBarItems(
                    leading: EditButton(),
                    trailing: Button(
                        action: {
                            withAnimation { Event.create(in: self.viewContext) }
                        }
                    ) { 
                        Image(systemName: "plus")
                    }
                )
            Text("Detail view content goes here")
                .navigationBarTitle(Text("Detail"))
        }.navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
}

struct MasterView: View {
    @Binding var title: String
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Event.timestamp, ascending: true)], 
        animation: .default)
    var events: FetchedResults<Event>

    @Environment(\.managedObjectContext)
    var viewContext
    @Environment(\.editMode) var mode

    var body: some View {
        VStack {
            if mode?.wrappedValue == .active {
                HStack {
                    Text("✏️")
                    TextField("Enter Title", text: $title)
                           }
            }
           
            List {
                ForEach(events, id: \.self) { event in
                    NavigationLink(
                        destination: DetailView(event: event)
                    ) {
                        Text("\(event.timestamp!, formatter: dateFormatter)")
                    }
                }.onDelete { indices in
                    self.events.delete(at: indices, from: self.viewContext)
                }
            }
        }.navigationBarTitle(mode?.wrappedValue == .active ? "" : title) 
    }
}

struct DetailView: View {
    @ObservedObject var event: Event

    var body: some View {
        Text("\(event.timestamp!, formatter: dateFormatter)")
            .navigationBarTitle(Text("Detail"))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        return ContentView().environment(\.managedObjectContext, context)
    }
}
