//
//  Repository.swift
//  MateMundo
//
//  Created by Pablo Cigoy on 03/06/2024.
//

import Foundation



class Repository {
    
    // Singleton-Instanz der Repository-Klasse, um eine zentrale Datenverwaltung zu gewährleisten.
    static let shared = Repository()
    
    private init() { }
    
    
    // Funktion zum abrufen der ListOfYerba
    func loadListOfYerbas () -> [MateModel] {
        return listOfYerbas
    }
    // Liste von Yerba
    private var listOfYerbas: [MateModel] = [
        MateModel(
            name: "Yerba Mate Rosamonte",
            image: "rosamonte-image",
            description: "Traditioneller Yerba Mate aus Syrien mit intensivem Geschmack.",
            price: 14.99,
            isAvailable: true,
            isFavorite: false,
            countryOfOrigin: "Syrien",
            rate: 4.7
        ),
        MateModel(
            name: "Syrien Green",
            image: "syrianMate",
            description: "Traditioneller Yerba Mate aus Syrien mit intensivem Geschmack.",
            price: 14.99,
            isAvailable: true,
            isFavorite: false,
            countryOfOrigin: "Syrien",
            rate: 4.7
        ),
        MateModel(
            name: "Piepore",
            image: "pipore",
            description: "Traditioneller Yerba Mate aus Syrien mit intensivem Geschmack.",
            price: 14.99,
            isAvailable: true,
            isFavorite: false,
            countryOfOrigin: "Syrien",
            rate: 4.7
        ),
        MateModel(
            name: "Cruz de Malta",
            image: "cruz_de_malta-image",
            description: "Ein milderer Yerba Mate, ideal für Anfänger.",
            price: 12.99,
            isAvailable: true,
            isFavorite: true,
            countryOfOrigin: "Brasilien",
            rate: 4.5
        ),
        MateModel(
            name: "Amanda",
            image: "amanda-image",
            description: "Ein klassischer Yerba Mate mit einem Hauch von Rauchigkeit.",
            price: 13.49,
            isAvailable: false,
            isFavorite: false,
            countryOfOrigin: "Argentinien",
            rate: 4.3
        ),
        
        MateModel(
            name: "La Tranquera",
            image: "la_tranquera-image",
            description: "Ein weicher und aromatischer Yerba Mate.",
            price: 11.99,
            isAvailable: true,
            isFavorite: true,
            countryOfOrigin: "Argentinien",
            rate: 4.6
        ),
        MateModel(
            name: "Taragüi",
            image: "taragui_image",
            description: "Ein kraftvoller Yerba Mate, perfekt für erfahrene Trinker.",
            price: 15.49,
            isAvailable: true,
            isFavorite: false,
            countryOfOrigin: "Argentinien",
            rate: 4.8
        ),
        MateModel(
            name: "CBSe",
            image: "cbse-image",
            description: "Yerba Mate mit einem Hauch von Kräutern und Früchten.",
            price: 13.99,
            isAvailable: true,
            isFavorite: true,
            countryOfOrigin: "Argentinien",
            rate: 4.4
        ),
        MateModel(
            name: "CBSe",
            image: "cbse_frutostropicales",
            description: "Yerba Mate mit einem Hauch von Kräutern und Früchten.",
            price: 13.99,
            isAvailable: true,
            isFavorite: true,
            countryOfOrigin: "Argentinien",
            rate: 4.4
        ),
        MateModel(
            name: "CBSe Nara ",
            image: "cbse_nara",
            description: "Yerba Mate mit einem Hauch von Kräutern und Früchten.",
            price: 13.99,
            isAvailable: true,
            isFavorite: true,
            countryOfOrigin: "Argentinien",
            rate: 4.4
        )
        
        
        
    ]
    
    // Liste von Favoriten-Yerba
    private var listOfFavoritenYerba: [MateModel] = []
    
    // Fügt ein Yerba zur Liste der favoriten hinzu.
    func getSavedListOfFavoritYerba(_ yerba: MateModel) {
        listOfFavoritenYerba.append(yerba)
    }
    
    // Gibt die Liste der favorisierten Yerba zurück.
    func getListOfFavorteYerba() -> [MateModel] {
        return listOfFavoritenYerba
    }
    
    // Entfernt ein Yerba aus der Liste der favorisierten Yerba.
    func removeFavoritYerba(_ yerba: MateModel) {
        if let index = listOfFavoritenYerba.firstIndex(where: { $0.id == yerba.id }) {
            listOfFavoritenYerba.remove(at: index)
        }
    }
    
}
