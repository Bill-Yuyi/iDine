//
//  OrderView.swift
//  iDine
//
//  Created by Yuyi Wang on 2024/01/11.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        NavigationStack{
            List{
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                    .onDelete(perform: deleteItem)
                }
                Section {
                    NavigationLink("Place Order") {
                        Text("Check out")
                    }
                }
            }
        }
        .navigationTitle("Order")
    }
    
    func deleteItem(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
}

#Preview {
    OrderView().environmentObject(Order())
}
