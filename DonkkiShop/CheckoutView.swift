//
//  CheckoutView.swift
//  DonkkiShop
//
//  Created by Gavin on 2023-08-22.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var user: User
    @Binding var isActive: Bool
    @Binding var checkOrder: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                Text("Shipping to: " + user.name)
                Divider()
                ForEach(user.curOrder.cart) { item in
                    HStack {
                        Text(item.donkki.name + " (" + String(item.amount) + "):")
                        Spacer()
                        Text("$" + String(format: "%.2f", user.curOrder.itemTotal(item: item)))
                    }
                }
                HStack {
                    Text("Subtotal:")
                    Spacer()
                    Text("$" + String(format: "%.2f", user.curOrder.subtotal()))
                }
                Spacer().frame(height: 20)
                HStack {
                    Text("Shipping & Handling:")
                    Spacer()
                    Text("$" + String(format: "%.2f", user.curOrder.shippingTotal()))
                }
                HStack {
                    Text("Total before tax:")
                    Spacer()
                    Text("$" + String(format: "%.2f", user.curOrder.subShippingTotal()))
                }
                HStack {
                    Text("Estimated GST/HST:")
                    Spacer()
                    Text("$" + String(format: "%.2f", user.curOrder.taxTotal()))
                }
                Spacer().frame(height: 20)
                HStack {
                    Text("Order Total:")
                        .foregroundColor(.primary)
                        .font(.headline)
                    Spacer()
                    Text("$" + String(format: "%.2f", user.curOrder.orderTotal()))
                        .foregroundColor(.primary)
                        .font(.headline)
                }
            }
            .padding([.leading, .trailing], 20)
            Spacer()
            Button(action: {
                print("order placed")
                user.addOrder()
                user.newOrder()
                checkOrder = true
                self.isActive.toggle()
            }, label: {
                Text("Place your order")
                    .frame(maxWidth: .infinity)
            })
            .buttonStyle(.borderedProminent)
            .padding([.leading, .trailing, .bottom], 10)
        }
        .padding([.top], -40)
    }
}
