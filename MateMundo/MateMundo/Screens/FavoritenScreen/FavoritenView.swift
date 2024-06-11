//
//  FavoritenView.swift
//  MateMundo
//
//  Created by Marco Grimme on 04.06.24.
//

import SwiftUI

struct FavoritenView: View {
    
    @StateObject var viewModel: FavoriteViewModel
    
    var body: some View {
        NavigationStack{
            VStack {
                
                if viewModel.listOfFavoritYerba.isEmpty {
                    VStack {
                        
                        Text("Mate-Favoriten")
                            .font(.largeTitle)
                        
                        
                        Image(.favmate2)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                        
                        
                        Text("Keine Favoriten vorhanden")
                            .font(.headline)
                            .foregroundStyle(.gray)
                    }
                } else {
                    Text("Mate-Favoriten")
                        .font(.largeTitle)
                        .padding(.leading)
                    List {
                        ForEach(viewModel.listOfFavoritYerba) { yerba in
                            HStack(spacing: 20) {
                                Image(yerba.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .clipped()
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(yerba.name)
                                        .font(.headline)
                                    
                                    Text(String(format: "%.2f €", yerba.price))
                                        .font(.footnote)
                                        .foregroundStyle(.primary)
                                }
                                .padding(.vertical, 10)
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                    
                }
            }
            
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                viewModel.loadFavoritesYerbas()
            }
        }
    }
        
        private func deleteItems(at offsets: IndexSet) {
            for index in offsets {
                let yerba = viewModel.listOfFavoritYerba[index]
                viewModel.removeFavoriteYerbaId(yerba)
            }
    }
}

#Preview {
    FavoritenView(viewModel: FavoriteViewModel())
}
