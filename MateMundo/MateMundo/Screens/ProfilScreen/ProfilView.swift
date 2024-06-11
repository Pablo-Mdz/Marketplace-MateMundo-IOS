//
//  ProfilView.swift
//  MateMundo
//
//  Created by Marco Grimme on 05.06.24.
//

import SwiftUI

struct ProfilView: View {
    @Binding var profile: Profile
    @State private var backgroundColor = Color(.systemBackground)
    @State private var showingNotification = false
    
    enum PaymentMethod: String, CaseIterable, Identifiable {
        case creditCard = "Kreditkarte"
        case paypal = "PayPal"
        case applePay = "Apple Pay"
        
        var id: String { self.rawValue }
    }
    
    let profileImages = ["Mate1", "Mate2", "Mate3", "Mate4"]
    
    var body: some View {
        ZStack {
            Form {
                Text("Profil-Einstellungen")
                    .font(.title)
                    .bold()
                
                Section(header: Text("Profilbild")) {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(profileImages, id: \.self) { imageName in
                                Image(imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80, height: 80)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(profile.profileImageName == imageName ? Color.blue : Color.clear, lineWidth: 4)
                                    )
                                    .onTapGesture {
                                        profile.profileImageName = imageName
                                    }
                                    .padding(5)
                            }
                        }
                    }
                }
                Section(header: Text("Profilinformationen")) {
                    TextField("Vorname", text: $profile.name)
                    TextField("Nachname", text: $profile.lastName)
                    TextField("Email-Adresse", text: $profile.email)
                    DatePicker("Geburtsdatum", selection: $profile.birthDate, displayedComponents: .date)
                }
                
                Section(header: Text("Adresse")) {
                    TextField("Straße und Hausnummer", text: $profile.address)
                    TextField("Stadt", text: $profile.city)
                    TextField("Postleitzahl", text: $profile.postalCode)
                }
                
                Section(header: Text("Zahlungsmethode")) {
                    Picker("Zahlungsmethode", selection: $profile.selectedPaymentMethod) {
                        ForEach(PaymentMethod.allCases) { method in
                            Text(method.rawValue).tag(method.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Button(action: {
                    saveProfile()
                }) {
                    Text("Profil Speichern")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                        .padding(.vertical)
                }
            }
            .scrollContentBackground(.hidden)
            .background(backgroundColor)
            
            // Benachrichtigungs-Overlay
            if showingNotification {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        VStack {
                            Image(systemName: "checkmark.circle")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundStyle(.white)
                            Text("Profil erfolgreich gespeichert")
                                .font(.headline)
                                .padding(.top, 10)
                        }
                        .padding()
                        .frame(width: 300, height: 250)
                        .background(Color.green.opacity(0.9))
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                        Spacer()
                    }
                    Spacer()
                }
                .padding(.top, 40)
                .transition(.move(edge: .top))
                .zIndex(1)
            }
        }
    }
    
    // Funktion zum Speichern des Profils
    private func saveProfile() {
        // Profil-Speicherlogik hier einfügen
        showingNotification = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            showingNotification = false
        }
    }
}

struct ProfilView_Previews: PreviewProvider {
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
            profileImageName: "profileImage"
        )
        return ProfilView(profile: .constant(profile))
    }
}
