//
//  ContentView.swift
//  MateMundo
//
//  Created by Marco Grimme on 03.06.24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var cartViewModel = CartViewModel()
    
    @State private var profile = Profile(
        name: "",
        lastName: "",
        email: "",
        birthDate: Date(),
        address: "",
        city: "",
        postalCode: "",
        selectedPaymentMethod: "Kreditkarte",
        profileImageName: "Mate1"
    )
    
    @State private var selectedTab : Int = 0
    
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            HomeView(viewModel: HomeViewModel(), cartViewModel: cartViewModel)
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(0)
            
            FavoritenView(viewModel: FavoriteViewModel())
                .tabItem {
                    Label("Favoriten", systemImage: "star.square.on.square.fill")
                }
                .tag(1)
            
            CartView(cartViewModel: cartViewModel, profile: $profile, selectedTab: $selectedTab)
                .tabItem {
                    Label("Warenkorb", systemImage: "cart.fill")
                }
                .tag(2)
            
            ProfilView(profile: $profile)
                .tabItem {
                    Label("Profil", systemImage: "person")
                }
                .tag(3)
        }
    }
    
    
}

#Preview {
    ContentView()
}
