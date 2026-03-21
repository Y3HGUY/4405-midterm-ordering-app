//
//  PaymentView.swift
//  midterm_ordering_app
//
//  Created by Tye Yeh on 3/20/26.
//

import SwiftUI

struct PaymentView: View {
    @Binding var cartItems: [CartItem]
    
    var totalPrice: Double {
        cartItems.reduce(0) {
            total, item in total + (item.price * Double(item.quantity))
        }
    }
    
    //Used to pay for items
    var body: some View {
        VStack(spacing: 25) {
            Text("Checkout")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Total Amount Due")
                .font(.headline)
            
            Text("$\(totalPrice, specifier: "%.2f")")
                .font(.system(size: 36, weight: .bold))
            
            NavigationLink("Pay Now") {
                ConfirmationView(cartItems: $cartItems)
            }
            .buttonStyle(.borderedProminent)
            .disabled(totalPrice == 0)
            
            NavigationLink("Back to Cart") {
                CartView(cartItems: $cartItems)
            }
            .buttonStyle(.bordered)
            
            NavigationLink("add more Items") {
                ContentView()
            }
            .buttonStyle(.bordered)
        }
        .padding()
        .navigationTitle("Payment")
    }
}
