//
//  TransactionsViewModel.swift
//  FinanceApp
//
//  Created by Edwy Lugo on 02/07/25.
//

import Foundation

final class TransactionsViewModel: ObservableObject {
    @Published var transactions: [Transaction] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let api = MockAPIService.shared

    func fetchTransactions() {
        isLoading = true
        errorMessage = nil

        api.fetchTransactions { [weak self] result in
            DispatchQueue.main.async {
                self?.transactions = result
                self?.isLoading = false
            }
        }
    }
}
