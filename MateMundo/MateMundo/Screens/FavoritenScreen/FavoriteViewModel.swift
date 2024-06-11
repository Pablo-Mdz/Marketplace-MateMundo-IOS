//
//  FavoriteViewModel.swift
//  MateMundo
//
//  Created by Marco Grimme on 04.06.24.
//

import Foundation
class FavoriteViewModel: ObservableObject {
    
    // Repository-Instanz zur Interaktion mit der Datenquelle
    private let repository = Repository.shared

    @Published var listOfFavoritYerba: [MateModel] = []

    // Initializer, der die Favoriten beim Start lädt
    init() {
        loadFavoritesYerbas()
    }

    // Lädt die Liste der favorisierten Yerba Mate-Modelle aus dem Repository
    func loadFavoritesYerbas() {
        listOfFavoritYerba = repository.getListOfFavorteYerba()
    }

    // Entfernt einen spezifischen Yerba Mate-Artikel aus den Favoriten
    func removeFavoriteYerbaId(_ yerba: MateModel) {
        if let index = listOfFavoritYerba.firstIndex(where: { $0.id == yerba.id }) {
            repository.removeFavoritYerba(yerba)
            listOfFavoritYerba[index].isFavorite = false
            listOfFavoritYerba.remove(at: index)
            loadFavoritesYerbas()
        }
    }

    // Entfernt einen Yerba Mate-Artikel aus den Favoriten
    func removeFavorite(_ yerba: MateModel) {
        if let index = listOfFavoritYerba.firstIndex(where: { $0.id == yerba.id }) {
            repository.removeFavoritYerba(yerba)
            listOfFavoritYerba.remove(at: index)
            loadFavoritesYerbas()
        }
    }
    
    // Speichert einen Yerba Mate-Artikel als Favorit
    func saveFavorite(_ yerba: MateModel) {
        if !listOfFavoritYerba.contains(where: { $0.id == yerba.id }) {
            repository.getSavedListOfFavoritYerba(yerba)
            loadFavoritesYerbas()
        }
    }

    // Überprüft, ob ein Yerba Mate-Artikel in den Favoriten ist
    func isFavorite(_ yerba: MateModel) -> Bool {
        return listOfFavoritYerba.contains(where: { $0.id == yerba.id })
    }
}
