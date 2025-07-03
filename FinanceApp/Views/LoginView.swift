//
//  LoginView.swift
//  FinanceApp
//
//  Created by Edwy Lugo on 03/07/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()

    var body: some View {
        if viewModel.isLoggedIn {
            MainTabView()
        } else {
            VStack(spacing: 24) {
                Text("Bem-vindo")
                    .font(.largeTitle)
                    .bold()

                TextField("Seu nome", text: $viewModel.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                Button(action: {
                    viewModel.login()
                }) {
                    Text("Entrar")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(viewModel.name.isEmpty ? Color.gray : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .disabled(viewModel.name.isEmpty)
                .padding(.horizontal)
            }
            .padding()
        }
    }
}

#Preview {
    LoginView()
}

