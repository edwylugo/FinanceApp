//
//  LoginViewModel.swift
//  FinanceApp
//
//  Created by Edwy Lugo on 03/07/25.
//

import Foundation

final class LoginViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var isLoggedIn: Bool = false

    func login() {
        guard !name.isEmpty else { return }
        isLoggedIn = true
    }
}
