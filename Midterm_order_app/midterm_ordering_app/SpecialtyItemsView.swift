//
//  SpecialtyItemsView.swift
//  midterm_ordering_app
//
//  Created by Tye Yeh on 3/19/26.
//

import SwiftUI


struct SpecialtyItemsView: View {
    @Binding var cartItems: [CartItem]
    
    //add some fun drinks
    //give price and description
    //link add cart
    
    let specialtyDrinks = [
        SpecialtyDrink(
            name: "Carmel Frappe",
            description: "Basically Icecream featuring Coffee",
            price: 5.99
        ),
        SpecialtyDrink(
            name: "Matcha Thing",
            description: "Green stuff, I think its good for you",
            price: 5.99
        ),
        SpecialtyDrink(
            name: "Pumpkin Spice Latte",
            description: "Screw it, October year round, you know whats up",
            price: 5.99
        )
    ]
    
    var body: some View {
        List {
            Section(header: Text("Specialty Drinks")) {
                ForEach(specialtyDrinks, id: \.name) { drink in
                    VStack(alignment: .leading, spacing: 8){
                        Text(drink.name)
                            .font(.headline)
                        
                        Text(drink.description)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        
                        HStack {
                            Text("$\(drink.price, specifier: "%.2f")")
                                .fontWeight(.medium)
                            
                            Spacer()
                            
                            Button("Add") {
                                let item = CartItem(name: drink.name, details: drink.description, price: drink.price, quantity: 1
                                )
                                cartItems.append(item)
                            }
                            .buttonStyle(.borderedProminent)
                        }
                    }
                    .padding(.vertical, 6)
                }
            }
        }
        .navigationTitle("Specialty Drinks")
    }
}
