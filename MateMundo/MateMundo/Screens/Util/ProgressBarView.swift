//
//  ProgressBarView.swift
//  MateMundo
//
//  Created by Michel Lobbos on 06.06.24.
//

import SwiftUI


struct PendulumImageView: View {
    @State private var rotationAngle: Double = -10
    @State private var swingingRight = true

    let timer = Timer.publish(every: 0.04, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Spacer()
            Image("MateMundoLogo")
                .resizable()
                .scaledToFit()
                .frame(height: 100)
                .rotationEffect(.degrees(rotationAngle))
                .onReceive(timer) { _ in
                    withAnimation(.easeInOut(duration: 0.02)) {
                        if swingingRight {
                            rotationAngle += 1
                            if rotationAngle >= 10 {
                                swingingRight = false
                            }
                        } else {
                            rotationAngle -= 1
                            if rotationAngle <= -10 {
                                swingingRight = true
                            }
                        }
                    }
                }
            Spacer()
        }
    }
}

struct PendulumImageView_Previews: PreviewProvider {
    static var previews: some View {
        PendulumImageView()
    }
}

