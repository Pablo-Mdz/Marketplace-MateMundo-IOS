//
//  MateMundoApp.swift
//  MateMundo
//
//  Created by Marco Grimme on 03.06.24.
//

import SwiftUI

@main
struct MateMundoApp: App {
    @StateObject private var loginViewModel = LoginViewModel()
    
    var body: some Scene {
        WindowGroup {
            if loginViewModel.userIsLoggedIn {
                ContentView()
            } else {
                LogInView()
                    .environmentObject(loginViewModel)
            }
        }
    }
}
