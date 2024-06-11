//
//  DeliveryView.swift
//  MateMundo
//
//  Created by Pablo Cigoy on 07/06/2024.
//

import SwiftUI

struct DeliveryView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 40) {
            Spacer()
            
            VStack(spacing: 20) {
                Image(systemName: "checkmark.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .foregroundStyle(.green)
                
                Text("Danke für Ihren Kauf!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Ihre Bestellung ist auf dem Weg und wird in 2-3 Werktagen ankommen.")
                    .font(.title2)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            
            Spacer()
            
            Button(action: {
                dismiss()
            }) {
                Text("Zurück zur Startseite")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            .padding(.horizontal)
        }
        .padding()
        .background(Color(.systemGroupedBackground))
        .navigationBarBackButtonHidden(true)
    }
}


struct DeliveryView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        DeliveryView()
        
    }
}
