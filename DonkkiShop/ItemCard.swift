//
//  ItemCard.swift
//  DonkkiShop
//
//  Created by Gavin on 2023-08-11.
//

import SwiftUI

struct ItemCard: View {
    @EnvironmentObject var user: User
    @State private var showAlert = false
    var item: Item
    
    var body: some View {
        HStack {
            VStack {
                Image(systemName: "plus")
                    .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                    .onTapGesture {
                        user.addItem(item: item.donkki)
                    }
                Spacer().frame(height: 30)
                Image(systemName: "trash")
                    .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                    .onTapGesture {
                        if (item.amount == 1) {
                            showAlert = true
                        } else {
                            user.removeItem(item: item.donkki)
                        }
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Are you sure you want to remove " + item.donkki.name + " from your cart?"),
                            primaryButton: .default(
                                Text("Cancel")
                            ),
                            secondaryButton: .destructive(
                                Text("Delete"),
                                action: {
                                    user.removeItem(item: item.donkki)
                                }
                            )
                        )
                    }
            }
            Image(item.donkki.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 90.0, height: 90.0)
            VStack(alignment: .leading, spacing: 3) {
                Text(item.donkki.name + " (" + String(item.amount) + ")")
                    .foregroundColor(.primary)
                    .font(.headline)
                Text("$" + String(item.donkki.price))
                    .foregroundColor(.secondary)
                    .font(.subheadline)
            }
        }
    }
}
