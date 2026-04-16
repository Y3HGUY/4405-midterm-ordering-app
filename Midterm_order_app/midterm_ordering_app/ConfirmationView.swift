//
//  ConfirmationView.swift
//  midterm_ordering_app
//
//  Created by Tye Yeh on 3/20/26.
//

import SwiftUI

struct ConfirmationView: View {
    @Binding var cartItems: [CartItem]
    
    
    
    var body: some View {
        VStack(spacing: 25) {
            Text("Order Successful!")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Your Order has been placed.")
                .font(.title3)
                .foregroundStyle(.secondary)
            
            Text("Use the Back button to return home")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
        .padding()
        .navigationTitle("Confirmation")
        .onAppear() {
            cartItems.removeAll()
        }
            
    }
}
