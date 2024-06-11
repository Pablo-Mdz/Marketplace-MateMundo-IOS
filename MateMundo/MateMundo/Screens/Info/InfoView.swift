//
//  CarouselView.swift
//  MateMundo
//
//  Created by Pablo Cigoy on 05/06/2024.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(carouselData, id: \.id) { item in
                        VStack(alignment: .leading, spacing: 10) {
                            Text(item.title)
                                .font(.title)
                                .fontWeight(.bold)
                                .underline()
                                .padding(.top, 20)
                                .padding(.horizontal)
                                .frame(maxWidth: .infinity, alignment: .center)

                            HStack {
                                Spacer()
                                Image(item.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 200)
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                                Spacer()
                            }
                            .padding(.horizontal)


                            Text(item.description)
                                .font(.body)
                                .italic()
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                                .padding(.top, 10)

                            Divider()
                                .padding(.horizontal)
                        }
                    }
                }
                .padding(.vertical, 20)
                .navigationTitle("Über Mate")
            }
        }
    }
}



struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
