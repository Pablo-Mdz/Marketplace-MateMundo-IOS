// DetailView.swift

import SwiftUI

struct DetailView: View {
    
    @StateObject var viewModel: HomeViewModel
    @ObservedObject var favoriteViewModel: FavoriteViewModel
    @ObservedObject var cartViewModel: CartViewModel
    
    @State private var isFavorite: Bool = false
    @State private var showToast: Bool = false
    @State private var toastMessage: String = ""
    
    @State private var showOrderSheet: Bool = false
    @State private var orderQuantity: Int = 1
    
    let yerba: MateModel
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Image(yerba.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
            }
            .padding(.horizontal, 100)
            .background(.white)
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text(yerba.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.primary)
                            .padding(.bottom, 10)
                        Spacer()
                        Button(action: {
                            if yerba.isAvailable {
                                showOrderSheet = true
                            }
                        }) {
                            Image(systemName: "cart.badge.plus")
                                .resizable()
                                .frame(width: 40, height: 35)
                                .foregroundStyle(yerba.isAvailable ? .blue : .gray)
                        }
                        .frame(width: 50, height: 50)
                        .shadow(radius: 5)
                    }
                    HStack {
                        Text("Preis:")
                            .font(.headline)
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text("\(yerba.price, specifier: "%.2f") €")
                            .font(.title2)
                            .foregroundStyle(.primary)
                    }
                    .padding(.vertical, 5)
                    HStack {
                        Text("Herkunft:")
                            .font(.headline)
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text(yerba.countryOfOrigin)
                            .font(.title2)
                            .foregroundStyle(.primary)
                    }
                    .padding(.vertical, 5)
                    HStack {
                        Text("Bewertung:")
                            .font(.headline)
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text("\(yerba.rate, specifier: "%.1f")")
                            .font(.title2)
                            .foregroundStyle(.primary)
                    }
                    .padding(.vertical, 5)
                    HStack {
                        Text("Verfügbarkeit:")
                            .font(.headline)
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text(yerba.isAvailable ? "Verfügbar" : "Nicht Verfügbar")
                            .font(.title2)
                            .foregroundStyle(yerba.isAvailable ? .green : .red)
                    }
                    .padding(.vertical, 5)
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Beschreibung:")
                            .font(.headline)
                            .foregroundStyle(.secondary)
                        
                        Text(yerba.description)
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                    .padding(.top, 10)
                }
                .padding(20)
                .background(Color(.systemGray6))
                .cornerRadius(20)
                .shadow(radius: 5)
                .padding()
            }
        }
        .background(Color(.systemGroupedBackground))
        .toolbar {
            Button(action: {
                if !isFavorite {
                    isFavorite.toggle()
                    favoriteViewModel.saveFavorite(yerba)
                    toastMessage = "\(yerba.name) wurde zu Favoriten hinzugefügt."
                } else {
                    isFavorite.toggle()
                    favoriteViewModel.removeFavorite(yerba)
                    toastMessage = "\(yerba.name) wurde aus den Favoriten entfernt."
                }
                withAnimation {
                    showToast = true
                }
            }) {
                Image(systemName: isFavorite ? "star.fill" : "star")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(.blue)
            }
            .frame(width: 50, height: 50)
            .shadow(radius: 5)
        }
        .overlay(
            Group {
                if showToast {
                    VStack {
                        Text(toastMessage)
                            .font(.headline)
                            .padding()
                            .background(Color.black.opacity(0.7))
                            .foregroundStyle(.white)
                            .cornerRadius(10)
                            .padding()
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.3))
                    .onTapGesture {
                        withAnimation {
                            showToast = false
                        }
                    }
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                showToast = false
                            }
                        }
                    }
                }
            }
        )
        .onAppear {
            isFavorite = favoriteViewModel.isFavorite(yerba)
        }
        .sheet(isPresented: $showOrderSheet) {
            VStack(spacing: 20) {
                Spacer()
                Spacer()
                Text("Bestellen")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                
                HStack {
                    Spacer()
                    Button(action: {
                        if orderQuantity > 1 {
                            orderQuantity -= 1
                        }
                    }) {
                        Image(systemName: "minus.circle")
                            .font(.title)
                            .foregroundStyle(.blue)
                    }
                    Spacer()
                    Text("\(orderQuantity)")
                        .font(.title)
                        .padding(.horizontal)
                    Spacer()
                    Button(action: {
                        orderQuantity += 1
                    }) {
                        Image(systemName: "plus.circle")
                            .font(.title)
                            .foregroundColor(.blue)
                    }
                    Spacer()
                }
                .padding()
                
                Button("Bestellung zum Warenkorb abschicken") {
                    cartViewModel.addToCart(yerba, quantity: orderQuantity)
                    showOrderSheet = false
                }
                .padding()
                .background(Color.blue)
                .foregroundStyle(.white)
                .cornerRadius(20)
                
                Spacer()
            }
            .presentationDetents([.fraction(0.3)]) // Sheet nimmt 30% des Bildschirms ein
        }
    }
}

#Preview {
    NavigationStack {
        DetailView(viewModel: HomeViewModel(), favoriteViewModel: FavoriteViewModel(), cartViewModel: CartViewModel(), yerba: MateModel(name: "Yerba Mate Rosamonte", image: "rosamonte-image", description: "Traditioneller Yerba Mate aus Argentinien mit intensivem Geschmack.", price: 14.99, isAvailable: true, isFavorite: false, countryOfOrigin: "Argentinien", rate: 4.7))
    }
}
