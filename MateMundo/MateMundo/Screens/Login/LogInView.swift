//
//  LogInView.swift
//  MateMundo
//
//  Created by Pablo Cigoy on 06/06/2024.
//

import SwiftUI

struct LogInView: View {
    /// Environment-Objekt, das den Login-Status und -Aktionen verwaltet.
    @EnvironmentObject var loginViewModel: LoginViewModel
    
    @State private var emailID: String = ""
    @State private var password: String = ""
    @State private var showHomeView = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 15) {
                Image("mate-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .hSpacing()
                
                Text("Mate Mundo")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding(.top, -50)
                    .hSpacing()
                
                Spacer(minLength: 0)
                
                Text("Login")
                    .font(.title)
                    .fontWeight(.heavy)
                
                
                Text("Bitte einloggen, um fortzufahren")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)
                    .padding(.top, -5)
                
                VStack(spacing: 25) {
                    LoginCardTextFieldView(sfIcon: "at", hint: "Email ID", value: $emailID)
                    
                    LoginCardTextFieldView(sfIcon: "lock", hint: "Password", isPassword: true, value: $password)
                    
                    Button("Passwort vergessen") {
                        // Logik zum Zurücksetzen des Passworts hier hinzufügen
                    }
                    .font(.callout)
                    .fontWeight(.heavy)
                    .tint(.green)
                    .opacity(0.7)
                    .hSpacing(.trailing)
                    
                    /// Schaltfläche zum Einloggen
                    GradientButton(title: "Login", icon: "arrow.right") {
                        loginViewModel.login()
                    }
                    .hSpacing(.trailing) // Rechtsbündige Ausrichtung
                    /// Deaktiviert die Schaltfläche, wenn E-Mail oder Passwort leer ist.
                    .disableWithOpacity(emailID.isEmpty || password.isEmpty)
                }
                .padding(.top, 20)
                
                Spacer(minLength: 0)
                
                HStack(spacing: 6) {
                    Text("Du hast noch kein Konto?")
                        .foregroundStyle(.gray)
                    Button("Regestrieren") {
                        // Navigation zur Registrierungsseite hier hinzufügen
                    }
                    .fontWeight(.bold)
                    .tint(.green)
                }
                .font(.callout)
                .hSpacing() // Zentrierte Ausrichtung
                
            }
            .padding(.vertical, 15)
            .padding(.horizontal, 25)
            .toolbar(.hidden, for: .navigationBar) // Navigation Bar verstecken
            .background(AnimatedBackground()) // Hintergrund mit Animation
        }
    }
}

/// Animierter Hintergrund für die Login-Ansicht.
private struct AnimatedBackground: View {
    /// Farben für die Phasen der Hintergrundanimation.
    let phases: [Color] = [.blue, .green, .orange, .yellow, .mint, .pink]
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(height: 150) // Höhe des animierten Bereichs
                .phaseAnimator(phases, content: { content, phase in
                    content
                        .overlay(phase)
                        .blur(radius: 180.0) // Weichzeichnen der Überlagerung
                }, animation: { _ in .easeInOut(duration: 3) }) // Animation mit EaseInOut
            Spacer()
        }
    }
}

/// Vorschau für SwiftUI Preview
#Preview {
    LogInView()
}


