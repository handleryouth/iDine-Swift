//
//  ItemDetail.swift
//  iDine
//
//  Created by Tony Gultom on 15/08/24.
//

import SwiftUI

struct ItemDetail: View {
    /*
     @EnvironmentObject property wrapper does some magic: it allows this variable not to have a value in code, because we’re saying it will already be set in the environment.
     */
    @EnvironmentObject var order: Order
    
    let item: MenuItem
    
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing){
                Image(item.mainImage).resizable().scaledToFit()
                Text("Photo: \(item.photoCredit)").padding(4)
                    .background(.black)
                    .font(.caption)
                    .foregroundStyle(.white).offset(x: -5, y: -5)
            }
                
            Text(item.description).padding()
            Button("Order This") {
                order.add(item: item)
            }
            .buttonStyle(.borderedProminent)
            Spacer()
                }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack{
        ItemDetail(item: MenuItem.example).environmentObject(Order())
    }
}
