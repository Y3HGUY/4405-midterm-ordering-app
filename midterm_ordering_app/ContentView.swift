//
//  ContentView.swift
//  midterm_ordering_app
//
//  Created by Tye Yeh on 3/17/26.
//

import SwiftUI
import Combine
import Foundation

struct ContentView: View {
    @StateObject private var orderManager = OrderManager()
    
    var body: some View {
        NavigationStack {
            VStack(spacing : 20) {
                Text("8 Create Coffee")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                NavigationLink("Build Your Own Drink") {
                    CustomBuilderView(orderManager: orderManager)
                }
                .buttonStyle(.borderedProminent)
                
                NavigationLink("Specialty Drinks") {
                    SpecialtyItemsView(orderManager: orderManager)
                }
                .buttonStyle(.borderedProminent)
                
                NavigationLink("View Cart") {
                    CartView(orderManager: orderManager)
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
