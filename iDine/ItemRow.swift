//
//  ItemRow.swift
//  iDine
//
//  Created by Tony Gultom on 15/08/24.
//

import SwiftUI

struct ItemRow: View {
    let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    let item: MenuItem
    var body: some View {
        HStack {
            Image(item.thumbnailImage).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/) .overlay(Circle().stroke(.gray, lineWidth: 2))
            VStack(alignment: .leading) {
                Text(item.name).font(.headline)
                Text("$\(item.price)")
            }
            
            /*
             we’re going to force the restriction text to be spaced apart from the rest of the row. SwiftUI has a dedicated view for this called Spacer,
             */
            
            Spacer()
            
            /*
             we need to tell Swift that the string itself is the identifier for each item. This can be done using the id parameter for ForEach, passing in \.self as its only parameter,
             */
            ForEach(item.restrictions, id: \.self) { restriction in Text(restriction).font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .background(colors[restriction, default: .black])
                    .clipShape(Circle())
                    .foregroundStyle(.white)
            }
            
        }
        
    }
}

#Preview {
    ItemRow(item: MenuItem.example)
}
