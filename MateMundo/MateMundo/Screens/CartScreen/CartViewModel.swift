//
//  CartViewModel.swift
//  MateMundo
//
//  Created by Michel Lobbos on 05.06.24.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published var cartItems: [CartItem] = []
    
    // Fügt eine bestimmte Menge eines Yerba-Artikels zum Warenkorb hinzu
    func addToCart(_ yerba: MateModel, quantity: Int) {
        if let index = cartItems.firstIndex(where: { $0.yerba.id == yerba.id }) {
            cartItems[index].quantity += quantity
        } else {
            let newItem = CartItem(yerba: yerba, quantity: quantity)
            cartItems.append(newItem)
        }
    }
    
    // Entfernt einen Yerba-Artikel aus dem Warenkorb
    func removeFromCart(_ yerba: MateModel) {
        if let index = cartItems.firstIndex(where: { $0.yerba.id == yerba.id }) {
            cartItems.remove(at: index)
        }
    }
    
    // Aktualisiert die Menge eines bestimmten Yerba-Artikels im Warenkorb
    func updateQuantity(_ yerba: MateModel, quantity: Int) {
        if let index = cartItems.firstIndex(where: { $0.yerba.id == yerba.id }) {
            cartItems[index].quantity = quantity
        }
    }
    
    // Berechnet die Gesamtkosten aller Artikel im Warenkorb
    func totalCost() -> Double {
        return cartItems.reduce(0) { $0 + ($1.yerba.price * Double($1.quantity)) }
    }
}
