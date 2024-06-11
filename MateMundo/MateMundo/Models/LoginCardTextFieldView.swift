//
//  Login.swift
//  MateMundo
//
//  Created by Pablo Cigoy on 06/06/2024.
//

import Foundation


import SwiftUI

struct LoginCardTextFieldView: View {
    var sfIcon: String
    var iconTint: Color = .gray
    var hint: String
    var isPassword: Bool = false
    
    // Binding-Variable, die den Textwert im Textfeld hält und von außen verändert werden kann.
    @Binding var value: String
    
    // Lokaler Zustand, der bestimmt, ob das Passwort angezeigt oder verborgen wird.
    @State private var showPassword: Bool = false
    
    var body: some View {
        HStack(alignment: .top, spacing: 8, content: {
            
            Image(systemName: sfIcon)
                .foregroundStyle(iconTint)
                .frame(width: 30)
                .offset(y: 2)
            
            
            VStack(alignment: .leading, spacing: 8, content: {
                // Überprüfen, ob das Textfeld ein Passwortfeld ist.
                if isPassword {
                    Group {
                        // Zeigen oder verbergen des Passworts basierend auf `showPassword`.
                        if showPassword {
                            // Normales Textfeld, wenn das Passwort sichtbar ist.
                            TextField(hint, text: $value)
                                .autocapitalization(.none)
                        } else {
                            // Sichere Eingabe für verborgene Passwortanzeige.
                            SecureField(hint, text: $value)
                                .autocapitalization(.none) 
                        }
                    }
                } else {
                    // Normales Textfeld für Nicht-Passwort-Felder.
                    TextField(hint, text: $value)
                        .autocapitalization(.none) // Keine automatische Großschreibung.
                }
                Divider()
            })
            .overlay(alignment: .trailing) {
                // Wenn das Textfeld ein Passwortfeld ist, füge eine Schaltfläche zum Anzeigen oder Verbergen des Passworts hinzu.
                if isPassword {
                    Button(action: {
                        withAnimation {
                            showPassword.toggle()
                        }
                    }) {
                        Image(systemName: showPassword ? "eye.slash" : "eye")
                            .foregroundStyle(.gray)
                            .padding(10)
                            .contentShape(.rect)
                    }
                }
            }
        })
    }
}
