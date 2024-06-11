//
//  View+Extensions.swift
//  MateMundo
//
//  Created by Pablo Cigoy on 06/06/2024.
//

import SwiftUI

/// Erweiterungen für `View`, die allgemeine Layout-Anpassungen und Zustandsveränderungen für SwiftUI-Ansichten bereitstellen.
extension View {

    /// Diese Funktion erweitert eine `View`, um ihre Breite maximal auszudehnen und die Inhalte entsprechend dem angegebenen Alignment auszurichten.
    @ViewBuilder
    func hSpacing(_ alignment: Alignment = .center) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment) // Streckt die Ansicht horizontal aus und richtet sie gemäß `alignment` aus.
    }

    /// Diese Funktion erweitert eine `View`, um ihre Höhe maximal auszudehnen und die Inhalte entsprechend dem angegebenen Alignment auszurichten.
    @ViewBuilder
    func vSpacing(_ alignment: Alignment = .center) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment) // Streckt die Ansicht vertikal aus und richtet sie gemäß `alignment` aus.
    }

    /// Diese Funktion erweitert eine `View`, um basierend auf einer Bedingung (z.B. `true` oder `false`) deaktiviert zu werden und ihre Opazität entsprechend anzupassen.
    @ViewBuilder
    func disableWithOpacity(_ condition: Bool) -> some View {
        self
            .disabled(condition) // Deaktiviert die Ansicht, wenn die Bedingung wahr (`true`) ist.
            .opacity(condition ? 0.5 : 1) // Setzt die Opazität der Ansicht auf 50 %, wenn sie deaktiviert ist; ansonsten bleibt sie bei 100 %.
    }
}
