//
//  ProductCardView.swift
//  MateMundo
//
//  Created by Michel Lobbos on 04.06.24.
//

import SwiftUI

struct ProductCardView: View {
    let yerba : MateModel
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(yerba.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 120)
                .padding(.horizontal)
            Text(yerba.name)
                .font(.headline)
                .foregroundColor(.primary)
            Text(yerba.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
            HStack {
                Text("Preis: \(yerba.price, specifier: "%.2f") €")
                    .font(.subheadline)
                    .foregroundColor(.primary)
                Spacer()
            }
        }
        .padding(10)
        .frame(height: 250)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.2), radius: 5)
    }
}

#Preview {
    ProductCardView(yerba: .init(name: "Yerba Mate Rosamonte", image: "rosamonte-image", description: "Traditioneller Yerba Mate aus Argentinien mit intensivem Geschmack.", price: 14.99, isAvailable: true, isFavorite: false, countryOfOrigin: "Syrien", rate: 4.7))
}
