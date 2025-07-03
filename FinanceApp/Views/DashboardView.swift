//
//  DashboardView.swift
//  FinanceApp
//
//  Created by Edwy Lugo on 03/07/25.
//

import SwiftUI

struct DashboardView: View {
    @Binding var didTransfer: Bool
    @StateObject private var viewModel = DashboardViewModel()
    @State private var showingTransferView = false

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                if viewModel.isLoading {
                    ProgressView("Carregando...")
                        .frame(maxWidth: .infinity, alignment: .center)
                } else {
                    if let account = viewModel.account {
                        Text("Saldo disponível")
                            .font(.headline)

                        Text(account.balance, format: .currency(code: "BRL"))
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.green)
                    }

                    Divider()

                    Text("Últimas transações")
                        .font(.headline)

                    if viewModel.transactions.isEmpty {
                        Text("Nenhuma transação encontrada.")
                            .foregroundColor(.secondary)
                    } else {
                        ForEach(viewModel.transactions.prefix(3)) { transaction in
                            TransactionRow(transaction: transaction)
                        }
                    }

                    Spacer()

                    Button(action: {
                        showingTransferView = true
                    }) {
                        Text("Nova Transferência")
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                }
            }
            .padding()
            .navigationTitle("Dashboard")
            .onAppear {
                viewModel.fetchDashboardDataIfNeeded()
            }
            .sheet(isPresented: $showingTransferView, onDismiss: {
                if didTransfer {
                    viewModel.refreshData()
                }
            }) {
                TransferView(didTransfer: $didTransfer)
            }
        }
    }
}

#Preview {
    DashboardView(didTransfer: .constant(true))
}
