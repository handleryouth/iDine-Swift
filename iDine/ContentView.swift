//
//  ContentView.swift
//  iDine
//
//  Created by Tony Gultom on 15/08/24.
//

import SwiftUI
import SwiftData

/*
 Views are structs in SwiftUI.
 */
struct ContentView: View {
    /*
     All views must conform to the View protocol.
     That protocol requires a computed property called body that contains the actual layout for the view.
     */
    //    var body: some View {
    //        VStack {
    //            Image(systemName: "globe")
    //                /*
    //                 In SwiftUI we call these modifiers because they modify the way the text view looks or acts.
    //                 */
    //                .imageScale(.large)
    //                .foregroundStyle(Color.accentColor)
    //            Text("Hello, world!")
    //        }
    //        .padding()
    //    }
    
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    
    
    var body: some View {
            NavigationStack {
                
                List{
                    ForEach(menu) {section in
                        Section(section.name) {
                            ForEach(section.items) {
                                
                        
                        
                                item in
                                /*
                                 behind the scenes it causes SwiftUI to do more work than you might think – every time it creates a row in our List it will also create the NavigationLink, and as part of that it will also create the ItemDetail for every visible row.
                                 */
//                                 NavigationLink{ItemDetail(item: item)}label: {
//                                    ItemRow(item: item)
//                                }
                                
                                NavigationLink(value: item) {
                                    ItemRow(item: item)
                                }
                                
                                .navigationDestination(for: MenuItem.self) {
                                    item in ItemDetail(item: item)
                                }
                            }
                        }
                        
                        
                    }
                }
                
                .navigationTitle("Menu")
                .listStyle(.grouped)
            }
    }
}

#Preview {
    ContentView().environmentObject(Order())
//        .modelContainer(for: Item.self, inMemory: true)
}
