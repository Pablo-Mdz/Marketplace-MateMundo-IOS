//
//  HomeViewModel.swift
//  MateMundo
//
//  Created by Pablo Cigoy on 03/06/2024.
//

import Foundation


class HomeViewModel: ObservableObject {
    // Zugriff auf das Repository, um Daten zu laden und zu speichern
    private let repository = Repository.shared

    @Published var listOfYerbas: [MateModel] = []

    @Published var searchText: String = ""

    @Published var selectedCountry: String? = nil

    // Initializer, der die Liste der Yerba Mate-Modelle lädt
    init() {
       loadListOfYerbas()
    }

    // Lädt die Liste der Yerba Mate-Modelle aus dem Repository
    func loadListOfYerbas() {
        listOfYerbas = repository.loadListOfYerbas()
    }

    // Berechnet eine gefilterte Liste der Yerba Mate-Modelle basierend auf dem Suchtext und dem ausgewählten Land
    var filteredYerbas: [MateModel] {
        var yerbas = listOfYerbas
        
        // Filtert nach dem Suchtext, wenn dieser nicht leer ist
        if !searchText.isEmpty {
            yerbas = yerbas.filter { $0.name.localizedCaseInsensitiveContains(searchText) ||
                $0.description.localizedCaseInsensitiveContains(searchText) }
        }
        
        // Filtert nach dem ausgewählten Herkunftsland, wenn eines ausgewählt ist
        if let country = selectedCountry {
            yerbas = yerbas.filter { $0.countryOfOrigin == country }
        }
        
        return yerbas
    }

    // Setzt das ausgewählte Herkunftsland
    func selectCountry(_ country: String?) {
        selectedCountry = country
    }
    
    // Speichert einen favorisierten Yerba Mate im Repository
    func saveFavoritYerba(_ yerba: MateModel) {
        repository.getSavedListOfFavoritYerba(yerba)
    }
    
    // Entfernt einen favorisierten Yerba Mate aus dem Repository
    func removeFavoritYerba(_ yerba: MateModel){
        repository.removeFavoritYerba(yerba)
    }
}
