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
    @State private var cartItems: [CartItem] = []
    
    var body: some View {
        NavigationStack {
            VStack(spacing : 20) {
                Text("8 Create Coffee")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                NavigationLink("Build Your Own Drink") {
                    CustomBuilderView(cartItems: $cartItems)
                }
                .buttonStyle(.borderedProminent)
                
                NavigationLink("Specialty Drinks") {
                    SpecialtyItemsView(cartItems: $cartItems)
                }
                .buttonStyle(.borderedProminent)
                
                NavigationLink("View Cart") {
                    CartView(cartItems: $cartItems)
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
