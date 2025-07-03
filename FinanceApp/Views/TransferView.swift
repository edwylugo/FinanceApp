//
//  TransferView.swift
//  FinanceApp
//
//  Created by Edwy Lugo on 03/07/25.
//

import SwiftUI

struct TransferView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = TransferViewModel()
    @Binding var didTransfer: Bool

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Destinatário")) {
                    TextField("Nome completo", text: $viewModel.recipientName)
                        .autocapitalization(.words)
                }

                Section(header: Text("Valor")) {
                    TextField("R$ 0,00", text: $viewModel.amountText)
                        .keyboardType(.decimalPad)
                }

                Section {
                    Button("Transferir") {
                        viewModel.performTransfer()
                    }
                    .disabled(viewModel.recipientName.isEmpty || viewModel.amountText.isEmpty)
                }

                if viewModel.isLoading {
                    ProgressView("Processando...")
                }

                if let success = viewModel.successMessage {
                    Text(success)
                        .foregroundColor(.green)
                        .onAppear {
                            didTransfer = true
                        }
                }

                if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                }
            }
            .navigationTitle("Nova Transferência")
            .navigationBarItems(trailing: Button("Fechar") {
                dismiss()
            })
        }
    }
}

#Preview {
    TransferView(didTransfer: .constant(true))
}

