//
//  OrderView.swift
//  iDine
//
//  Created by Tony Gultom on 15/08/24.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    
    
    func deleteItems(at offsets: IndexSet) {
        
    }
    
    var body: some View {
        NavigationStack {
            List {
                           Section {
                               ForEach(order.items) { item in
                                   HStack {
                                       Text(item.name)
                                       Spacer()
                                       Text("$\(item.price)")
                                   }
                               }.onDelete(perform: deleteItems)
                           }

                           Section {
                               NavigationLink("Place Order") {
                                   CheckoutView()
                               }
                           }.disabled(order.items.isEmpty)
                       }
                       .navigationTitle("Order")
        }
    }
}

#Preview {
    OrderView().environmentObject(Order())
}
