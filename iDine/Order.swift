//
//  Order.swift
//  iDine
//
//  Created by Yuyi Wang on 2024/01/11.
//

import Foundation
class Order: ObservableObject {
    @Published var items = [MenuItem]()
    func add(item: MenuItem) {
        items.append(item)
    }
}
