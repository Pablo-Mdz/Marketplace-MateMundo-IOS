//
//  GradientButton.swift
//  MateMundo
//
//  Created by Pablo Cigoy on 06/06/2024.
//

import SwiftUI

struct GradientButton: View {
    var title: String
    var icon: String
    var onClick: () -> ()
    
    var body: some View {
        Button(action: onClick, label: {
            HStack(spacing: 15) {
                Text(title)
                Image(systemName: icon)
            }
            .fontWeight(.bold)
            .foregroundStyle(.black)
            .padding(.vertical, 12)
            .padding(.horizontal, 35)
            .background(.linearGradient(colors: [.green.opacity(0.4), .green], startPoint: .top, endPoint: .bottom), in: Capsule())
        })
    }
}

   
#Preview {
    LogInView()
}
