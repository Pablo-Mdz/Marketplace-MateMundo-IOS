//
//  CartView.swift
//  MateMundo
//
//  Created by Michel Lobbos on 05.06.24.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var cartViewModel: CartViewModel
    @Binding var profile: Profile
    @State private var showingSheet = false
    @Binding var selectedTab: Int
    @State private var isDeliveryViewPresented = false
    
    var body: some View {
        VStack {
            Text("Warenkorb")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            List {
                ForEach(cartViewModel.cartItems) { item in
                    HStack {
                        Image(item.yerba.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                        
                        VStack(alignment: .leading) {
                            Text(item.yerba.name)
                                .font(.headline)
                            Text("Preis: \(item.yerba.price, specifier: "%.2f") €")
                                .font(.subheadline)
                        }
                        Spacer()
                        HStack {
                            Button(action: {
                                if item.quantity > 1 {
                                    cartViewModel.updateQuantity(item.yerba, quantity: item.quantity - 1)
                                }
                            }) {
                                Image(systemName: "minus.circle")
                                    .foregroundStyle(.blue)
                            }
                            .buttonStyle(.plain)
                            
                            Text("\(item.quantity)")
                                .font(.headline)
                                .padding(.horizontal)
                            
                            Button(action: {
                                cartViewModel.updateQuantity(item.yerba, quantity: item.quantity + 1)
                            }) {
                                Image(systemName: "plus.circle")
                                    .foregroundStyle(.blue)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .onDelete { indexSet in
                    indexSet.forEach { index in
                        let item = cartViewModel.cartItems[index]
                        cartViewModel.removeFromCart(item.yerba)

                    }
                }
            }
            .listStyle(.insetGrouped)
            
            HStack {
                Text("Gesamt: \(cartViewModel.totalCost(), specifier: "%.2f") €")
                    .font(.title)
                    .padding()
                Spacer()
                Button("Bestellen") {
                    showingSheet.toggle()
                }
                .padding()
                .background(Color.blue)
                .foregroundStyle(.white)
                .cornerRadius(10)

            }
            .padding()
        }
        .sheet(isPresented: $showingSheet, onDismiss: { isDeliveryViewPresented.toggle() }) {
            PaymentSheetContentView(
                profile: $profile,  // Hier wird das Binding übergeben
                cartItems: cartViewModel.cartItems,
                totalCost: cartViewModel.totalCost(),
                isPresented: $showingSheet
            )
        }
        .fullScreenCover(isPresented: $isDeliveryViewPresented, onDismiss: {
            selectedTab = 0
        }) {
            DeliveryView()
        }
        
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = CartViewModel()
        viewModel.cartItems = [
            CartItem(yerba: MateModel(name: "Yerba Mate Rosamonte", image: "rosamonte-image", description: "Traditioneller Yerba Mate aus Argentinien mit intensivem Geschmack.", price: 14.99, isAvailable: true, isFavorite: false, countryOfOrigin: "Argentinien", rate: 4.7), quantity: 1)
        ]
        let profile = Profile(
            name: "John",
            lastName: "Doe",
            email: "john.doe@example.com",
            birthDate: Date(),
            address: "123 Hauptstraße",
            city: "Irgendwo",
            postalCode: "12345",
            selectedPaymentMethod: "Kreditkarte",
            profileImageName: "profileImage"
        )
        
        return NavigationStack {
            CartView(cartViewModel: viewModel, profile: .constant(profile), selectedTab: .constant(.init()))
        }
    }
}
