//
//  LoginViewModel.swift
//  MateMundo
//
//  Created by Pablo Cigoy on 06/06/2024.
//

import Foundation


import Combine

class LoginViewModel: ObservableObject {
//    @Published var emailID: String = ""
//    @Published var password: String = ""
    @Published var userIsLoggedIn: Bool = false

    func login() {
        userIsLoggedIn = true
    }
}
