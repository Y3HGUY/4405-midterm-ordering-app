//
//  CustomBuilderView.swift
//  midterm_ordering_app
//
//  Created by Tye Yeh on 3/19/26.
//

import SwiftUI
import Combine

struct CustomBuilderView: View {
    @ObservedObject var orderManager: OrderManager
    
    //View for creating cart items to put together for customers
    //include items, sizing, and other details
    @State private var selectSize = "Medium"
    @State private var addWhippedCream = false
    @State private var addCarmelTop = false
    @State private var addExtraServing = false
    @State private var quantity = 1
    
    //allows for choice of sizing
    let sizes = ["Small" , "Medium" , "Large"]
    
    var basePrice: Double {
        switch selectSize {
        case "Small" :
            return 3.00
        case "Medium" :
            return 5.00
        case "large" :
            return 6.00
        default:
            return 4.50
        }
    }
    //for addons
    var addOnPrice: Double {
        var total = 0.0
        
        if addWhippedCream {
            total += 0.50
        }
        if addCarmelTop {
            total += 0.75
        }
        if addExtraServing {
            total += 1.00
        }
        
        return total
    }
    
    var itemPrice: Double {
        basePrice + addOnPrice
    }
    
    // details for addons
    var detailsText: String {
        var details: [String] = [selectSize]
        
        if addWhippedCream {
            details.append("Whipped your cream")
        }
        if addCarmelTop {
            details.append("Carmel your Top")
        }
        if addExtraServing {
            details.append("added extra serving ")
        }
        return details.joined(separator: ",")
    }
    
    //Ordering form
    var body: some View {
        Form {
            Section(header: Text("Choose a Size")) {
                Picker("Size", selection: $selectSize) {
                    ForEach(sizes, id: \.self) {size in Text(size)
                    }
                }
                .pickerStyle(.segmented)
            }
            
        }
        
        Section(header: Text("Add-ons")) {
            Toggle("Whipped Cream (+$0.50)", isOn: $addWhippedCream)
            Toggle("Carmel Drizzle (+$0.75)", isOn: $addCarmelTop)
            Toggle("Add Extra seving (+$1.00)", isOn: $addExtraServing)
        }
        
        Section(header: Text("Quantity")) {
            Stepper("Quantity: \(quantity)", value: $quantity, in: 1...10 )
        }
        
        Section(header: Text("Price")) {
            Text("Price per item: $\(itemPrice, specifier: "%.2f")")
            Text("Total: $\(itemPrice * Double(quantity), specifier:"%.2f" )")
        }
        Section {
            Button("Add to Cart") {
                let item = CartItem(
                    name: "Custom Coffe",
                    details: detailsText,
                    price: itemPrice,
                    quantity: quantity
                )
                orderManager.addItem(item)
            }
        }
        .navigationTitle("Build Your Drink!")
    }
}
