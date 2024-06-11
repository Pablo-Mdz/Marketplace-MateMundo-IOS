//
//  MateModel.swift
//  MateMundo
//
//  Created by Pablo Cigoy on 03/06/2024.
//

import Foundation


struct MateModel: Identifiable {
    let name: String
    let image: String
    let description: String
    let price: Double
    let isAvailable: Bool
    var isFavorite: Bool
    let countryOfOrigin: String
    var rate: Double
    
    //Identifiable
    let id = UUID ()
    
    
  
}
