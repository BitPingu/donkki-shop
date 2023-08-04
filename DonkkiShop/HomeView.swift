//
//  HomeView.swift
//  DonkkiShop
//
//  Created by Gavin on 2023-07-27.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        List(donkkiList) { donkki in
            NavigationLink(destination: DonkkiView(donkki: donkki)) {
                DonkkiCard(donkki: donkki)
            }
        }
        .listStyle(.plain)
    }
}
