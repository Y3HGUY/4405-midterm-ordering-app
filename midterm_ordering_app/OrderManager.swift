//
//  OrderManager.swift
//  midterm_ordering_app
//
//  Created by Tye Yeh on 3/19/26.
//

import Foundation
import SwiftUI
import Combine


class OrderManager: ObservableObject {
    @Published var cartItems: [CartItem] = []
    
    //calc total price
    var totalPrice: Double {
        cartItems.reduce(0) { $0 + $1.price * Double($1.quantity)}
    }
    //adds item to cart
    func addItem(_ item: CartItem) {
        cartItems.append(item)
    }
    //remove items
    func removeItems(at offsets: IndexSet) {
        cartItems.remove(atOffsets: offsets)
    }
    //clear carts 
    func clearCart() {
        cartItems.removeAll()
    }
}
