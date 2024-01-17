//
//  iDineApp.swift
//  iDine
//
//  Created by Yuyi Wang on 1/9/24.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
