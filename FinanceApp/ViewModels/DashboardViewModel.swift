//
//  DashboardViewModel.swift
//  FinanceApp
//
//  Created by Edwy Lugo on 02/07/25.
//

import Foundation
import Combine

final class DashboardViewModel: ObservableObject {
    @Published var account: Account?
    @Published var transactions: [Transaction] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let api = MockAPIService.shared
    private var hasLoaded: Bool = false

    func fetchDashboardDataIfNeeded() {
        guard !hasLoaded else { return }
        hasLoaded = true
        fetchDashboardData()
    }

    func refreshData() {
        // usado ao voltar da TransferView, por exemplo
        hasLoaded = false
        fetchDashboardDataIfNeeded()
    }

    private func fetchDashboardData() {
        isLoading = true
        errorMessage = nil

        let group = DispatchGroup()

        group.enter()
        api.fetchAccount { [weak self] account in
            self?.account = account
            group.leave()
        }

        group.enter()
        api.fetchTransactions { [weak self] transactions in
            self?.transactions = transactions
            group.leave()
        }

        group.notify(queue: .main) { [weak self] in
            self?.isLoading = false
        }
    }
}

