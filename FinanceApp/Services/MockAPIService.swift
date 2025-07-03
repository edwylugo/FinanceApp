//
//  MockAPIService.swift
//  FinanceApp
//
//  Created by Edwy Lugo on 03/07/25.
//

import Foundation

final class MockAPIService {
    static let shared = MockAPIService()

    private init() {
        // Dados iniciais
        account = Account(id: UUID(), ownerName: "João Silva", balance: 2500)
        transactions = [
            Transaction(id: UUID(), title: "Depósito Inicial", amount: 2500, date: Date(), type: .credit)
        ]
    }

    private var account: Account
    private var transactions: [Transaction]

    // MARK: - Métodos Públicos

    func fetchAccount(completion: @escaping (Account) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            completion(self.account)
        }
    }

    func fetchTransactions(completion: @escaping ([Transaction]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            completion(self.transactions.sorted { $0.date > $1.date })
        }
    }

    func performTransfer(to name: String, amount: Double, completion: @escaping (Result<Void, Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            guard amount > 0, amount <= self.account.balance else {
                completion(.failure(MockAPIError.insufficientFunds))
                return
            }

            self.account.balance -= amount

            let transaction = Transaction(
                id: UUID(),
                title: "Transferência para \(name)",
                amount: amount,
                date: Date(),
                type: .debit
            )

            self.transactions.append(transaction)
            completion(.success(()))
        }
    }
}

// MARK: - Erros

enum MockAPIError: Error, LocalizedError {
    case insufficientFunds

    var errorDescription: String? {
        switch self {
        case .insufficientFunds:
            return "Saldo insuficiente para realizar a transferência."
        }
    }
}
