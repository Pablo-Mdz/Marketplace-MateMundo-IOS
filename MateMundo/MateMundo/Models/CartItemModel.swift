//
//  CartItemModel.swift
//  MateMundo
//
//  Created by Michel Lobbos on 05.06.24.
//

import Foundation

struct CartItem: Identifiable {
    let yerba: MateModel
    var quantity: Int
    
    let id = UUID()

}
