//
//  Transaction.swift
//  FinanceApp
//
//  Created by Edwy Lugo on 02/07/25.
//

import Foundation

enum TransactionType: String, Codable {
    case credit
    case debit
}

struct Transaction: Identifiable, Codable {
    let id: UUID
    let title: String
    let amount: Double
    let date: Date
    let type: TransactionType
}
