//
//  CartView.swift
//  midterm_ordering_app
//
//  Created by Tye Yeh on 3/19/26.
//

//display cart stuff
//add remove items

import SwiftUI

struct CartView: View {
    @Binding var cartItems: [CartItem]
    
    var totalPrice: Double {
        cartItems.reduce(0) { total, item in
            total + (item.price * Double(item.quantity))
        }
    }
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("Your Order")) {
                    if cartItems.isEmpty {
                        Text("Your cart is empty")
                            .foregroundStyle(.secondary)
                    } else {
                        ForEach(cartItems.indices, id:  \.self) { index in
                            VStack(alignment: .leading, spacing: 6 ){
                                Text(cartItems[index].name)
                                    .font(.headline)
                                
                                Text(cartItems[index].details)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                                
                                Text("Quantity: $\(cartItems[index].quantity)")
                                    .font(.subheadline)
                                
                                Text("Item Total: $\(cartItems[index].price * Double(cartItems[index].quantity), specifier: "%.2f")")
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                            }
                            .padding(.vertical, 4)
                        }
                        .onDelete { indexSet in cartItems.remove(atOffsets: indexSet)
                        }
                    }
                }
                Section(header: Text("Total")) {
                    Text("$\(totalPrice, specifier: "%.2f")")
                        .font(.title3)
                        .fontWeight(.bold)
                }
            }
            VStack(spacing: 12) {
                Text("Use back button for more items")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                
                
                NavigationLink("Proceed to Checkout") {
                    PaymentView(cartItems: $cartItems)
                }
                .buttonStyle(.borderedProminent)
                .disabled(cartItems.isEmpty)
            }
            .padding()
        }
        .navigationTitle("Cart Summary")
    }
}
