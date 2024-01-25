//
//  CheckoutView.swift
//  iDine
//
//  Created by Yuyi Wang on 1/16/24.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order : Order
    @State private var selectedPaymentMethod = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tip = 15
    
    let paymentMethods = ["Cash", "Card", "Points"]
    let tipAmounts = [10, 15, 20, 25, 0]
    
    var totalPrice: String {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tip)
        return (total + tipValue).formatted(.currency(code: "USD"))
    }
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $selectedPaymentMethod) {
                    ForEach(paymentMethods,id: \.self) {
                        Text($0)
                    }
                }
                
                Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
                if addLoyaltyDetails {
                    TextField("Enter your loyalty number", text: $loyaltyNumber)
                }
               
            }
            
            Section("Add a tip?") {
                Picker("Percentage:", selection: $tip) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Total:$\(totalPrice)") {
                Button("Confirm order") {
                    // place the order
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CheckoutView()
        .environmentObject(Order())
}
