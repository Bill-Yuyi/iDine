//
//  ItemDetail.swift
//  iDine
//
//  Created by Yuyi Wang on 1/9/24.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var order: Order
    let item: MenuItem
    var body: some View {
        VStack{
            ZStack(alignment:.bottomTrailing){
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            
            Text(item.description)
                .padding()
            Spacer()
            Button("Order This") {
                order.add(item: item)
            }
            .buttonStyle(.borderedProminent)
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack{
        ItemDetail(item: MenuItem.example)
    }
    
}
