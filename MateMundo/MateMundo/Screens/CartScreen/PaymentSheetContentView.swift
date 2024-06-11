//
//  PaymentSheetContentView.swift
//  MateMundo
//
//  Created by Marco Grimme on 05.06.24.
//

import SwiftUI

struct PaymentSheetContentView: View {
    @Environment(\.dismiss) private var dismiss
    
    @Binding  var profile: Profile
    var cartItems: [CartItem]
    var totalCost: Double
    
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            Text("Bestell-Übersicht")
                .font(.largeTitle)
                .padding()
            
            // Horizontale Scroll-Ansicht für die Produkte
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(cartItems) { item in
                        VStack {
                            Image(item.yerba.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text(item.yerba.name)
                                .font(.caption)
                                .frame(width: 80,height: 10)
                            
                            Text("Anzahl: \(item.quantity)")
                                .font(.caption2)
                                .foregroundStyle(.gray)
                        }
                        .padding()
                    }
                }
            }
            .padding(.bottom)
            
            // Lieferadresse und Bestellinformationen
            Form {
                Section(header: Text("Lieferinformationen").font(.headline)) {
                    // Profilbild anzeigen
                    HStack {
                        VStack {
                            Image(profile.profileImageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.blue, lineWidth: 2) 
                                )
                                .shadow(radius: 5)
                                .padding(.trailing, 10)
                            
                            Text("Profilbild")
                                .font(.caption)
                                .foregroundStyle(.gray)
                                .padding(.top,4)
                        }
                        
                        
                        VStack(alignment: .leading) {
                            Text("Name: \(profile.name) \(profile.lastName)")
                            Text("Adresse: \(profile.address)")
                            Text("Stadt: \(profile.city)")
                            Text("Postleitzahl: \(profile.postalCode)")
                        }
                    }
                }
                
                Section(header: Text("Warenkorb Zusammenfassung").font(.callout)) {
                    Text("Anzahl der Artikel: \(cartItems.reduce(0) { $0 + $1.quantity })")
                    Text("Gesamt: \(totalCost, specifier: "%.2f") €")
                        .font(.title2)
                }
            }
            
            // Bestellung abschließen Button
            Button("Bestellung abschließen") {
                // Logik zum Abschließen der Bestellung hier einfügen
                dismiss()
                //                isDeliveryViewPresented.toggle()
            }
            .padding()
            .background(Color.blue)
            .foregroundStyle(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}

struct PaymentSheetContentView_Previews: PreviewProvider {
    @State static var isPresented = true
    static var previews: some View {
        let profile = Profile(
            name: "John",
            lastName: "Doe",
            email: "john.doe@example.com",
            birthDate: Date(),
            address: "123 Hauptstraße",
            city: "Irgendwo",
            postalCode: "12345",
            selectedPaymentMethod: "Kreditkarte",
            profileImageName: "profileImage" // Example image name
        )
        return PaymentSheetContentView(
            profile: .constant(profile),
            cartItems: [
                CartItem(yerba: MateModel(name: "Yerba Mate Rosamonte", image: "rosamonte-image", description: "Traditioneller Yerba Mate aus Argentinien mit intensivem Geschmack.", price: 14.99, isAvailable: true, isFavorite: false, countryOfOrigin: "Argentinien", rate: 4.7), quantity: 1)
            ],
            totalCost: 14.99,
            isPresented: .constant(true)
        )
    }
}
