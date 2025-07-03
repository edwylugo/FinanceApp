//
//  TransactionsView.swift
//  FinanceApp
//
//  Created by Edwy Lugo on 03/07/25.
//

import SwiftUI

struct TransactionsView: View {
    @StateObject private var viewModel = TransactionsViewModel()
    @Binding var didTransfer: Bool

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Carregando transações...")
                } else if viewModel.transactions.isEmpty {
                    Text("Nenhuma transação encontrada.")
                        .foregroundColor(.secondary)
                } else {
                    List(viewModel.transactions) { transaction in
                        TransactionRow(transaction: transaction)
                    }
                }
            }
            .navigationTitle("Histórico")
            .onAppear {
                if didTransfer {
                    viewModel.fetchTransactions()
                    didTransfer = false
                }
            }
        }
    }
}

#Preview {
    TransactionsView(didTransfer: .constant(true))
}
