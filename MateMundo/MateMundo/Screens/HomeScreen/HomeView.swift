//
//  HomeView.swift
//  MateMundo
//
//  Created by Pablo Cigoy on 03/06/2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel
    @StateObject var favoriteViewModel = FavoriteViewModel()
    @ObservedObject var cartViewModel: CartViewModel
    
    var body: some View {
        NavigationStack{
            
            VStack {
                SearchBar(text: $viewModel.searchText)
                    .padding(.horizontal)
                ScrollView(.horizontal) {
                    HStack {
                        FilterButtonView(title: "All", selectedCountry: $viewModel.selectedCountry, country: nil)
                        FilterButtonView(title: "Argentinien", selectedCountry: $viewModel.selectedCountry, country: "Argentinien")
                        FilterButtonView(title: "Brasilien", selectedCountry: $viewModel.selectedCountry, country: "Brasilien")
                        FilterButtonView(title: "Syrien", selectedCountry: $viewModel.selectedCountry, country: "Syrien")
                    }
                }
                .padding(.horizontal)
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(viewModel.filteredYerbas) { yerba in
                            NavigationLink(destination: DetailView(viewModel: viewModel, favoriteViewModel: favoriteViewModel, cartViewModel: cartViewModel, yerba: yerba)) {
                                ProductCardView(yerba: yerba)
                            }
                        }
                    }
                    .padding(.vertical, 7)
                    .padding(.horizontal)
                }
                .navigationTitle("Mate Mundo")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: InfoView()) {
                            Image(systemName: "info.circle")
                        }
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HomeView(viewModel: HomeViewModel(), cartViewModel: CartViewModel())
        }
    }
}
