//
//  InfoModel.swift
//  MateMundo
//
//  Created by Pablo Cigoy on 05/06/2024.
//

import Foundation

struct InfoItem: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let description: String
}


// list of information to show on info screen
let carouselData: [InfoItem] = [
    InfoItem(
        imageName: "yerba-campo",
        title: "Produktionsfelder",
        description: "Die Produktionsfelder von Yerba Mate befinden sich hauptsächlich in Argentinien, Brasilien und Paraguay. Diese Regionen bieten das ideale Klima für den Anbau von Yerba Mate, das gut durchlässige Böden und eine angemessene Menge an Schatten zum Wachsen benötigt."
    ),
    InfoItem(
        imageName: "mate-preparation",
        title: "Mate-Zubereitung",
        description: "Mate wird zubereitet, indem eine Kalebasse (Behälter) mit getrockneten Yerba Mate Blättern und heißem Wasser gefüllt wird. Er wird durch eine Bombilla getrunken, eine Art Metallstrohhalm mit einem Filter am unteren Ende. Es ist ein soziales Getränk und wird unter Freunden und Familie geteilt."
    ),
    InfoItem(
        imageName: "cultural-importance",
        title: "Kulturelle Bedeutung",
        description: "Mate hat eine große kulturelle Bedeutung in Ländern wie Argentinien, Uruguay, Paraguay, Brasilien und Syrien. Es ist mehr als nur ein Getränk; es ist ein Symbol für Freundschaft und Gemeinschaft. In Syrien zum Beispiel wurde Mate von Einwanderern eingeführt und ist zu einem beliebten Getränk geworden."
    ),
    InfoItem(
        imageName: "health-benefits",
        title: "Gesundheitliche Vorteile",
        description: "Mate ist bekannt für seine zahlreichen gesundheitlichen Vorteile. Es ist reich an Antioxidantien, Vitaminen und Mineralstoffen. Es wird auch angenommen, dass es die Konzentration und Energie verbessert und positive Effekte auf die Verdauung und das Immunsystem hat."
    )
]
