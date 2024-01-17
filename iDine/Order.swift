//
//  Order.swift
//  iDine
//
//  Created by Yuyi Wang on 2024/01/11.
//

import Foundation
class Order: ObservableObject {
    @Published var items = [MenuItem]()
    @Published var total = 0
    
    func add(item: MenuItem) {
        items.append(item)
        total += item.price
    }
    
    
}
