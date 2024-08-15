//
//  CheckoutView.swift
//  iDine
//
//  Created by Tony Gultom on 15/08/24.
//

import SwiftUI

struct CheckoutView: View {
    let paymentTypes = ["Cash", "Credit", "IDine Points"]
    let tipAmounts = [10, 15, 20, 25, 0]
    
    
    var totalPrice: String {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        return (total + tipValue).formatted(.currency(code: "USD"))
    }
    
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    
    @State private var tipAmount = 15
    
    /*
     If you want to use simple values that are used only by the current view you should use @State for your property wrapper.
     */
    @State private var paymentType = "Cash"
    
    @State private var showingPaymentAlert = false
    
    @EnvironmentObject var order: Order
    var body: some View {
        NavigationStack{
            Form {
                Section{
                    Picker("How do you want to pay", selection: $paymentType){
                        ForEach(paymentTypes, id: \.self) {
                                        Text($0)
    }
                    }
                }
                
                Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
                
                if addLoyaltyDetails {
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }
                
                Section("Add a tip?") {
                    Picker("Percentage", selection: $tipAmount) {
                        ForEach(tipAmounts, id: \.self) {
                            Text("\($0)%")
                        }
                    }
                }
                
                
                Section("Total: \(totalPrice)") {
                    Button("Confirm Order") {
                        showingPaymentAlert.toggle()
                    }
                }
             
            }
            .navigationTitle("Payment")
            .navigationBarTitleDisplayMode(.inline)
            .alert("Order confirmed", isPresented: $showingPaymentAlert) {
                
            } message: {
                Text("Your total was \(totalPrice) - Thank you!")
            }
        }
        
    }
}

#Preview {
    CheckoutView().environmentObject(Order())
}
