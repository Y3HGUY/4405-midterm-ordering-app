//
//  CartItem.swift
//  midterm_ordering_app
//
//  Created by Tye Yeh on 3/19/26.
//

import Foundation

struct CartItem: Identifiable {
    let id = UUID()
    let name: String
    let details: String
    let price: Double
    let quantity: Int
}
