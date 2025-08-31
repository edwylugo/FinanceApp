//
//  TransactionRow.swift
//  FinanceApp
//
//  Created by Edwy Lugo on 03/07/25.
//

import SwiftUI

struct TransactionRow: View {
    let transaction: Transaction

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(transaction.title)
                    .font(.subheadline)
                Text(transaction.date, format: .dateTime.day().month().year())
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text(transaction.amount.asCurrencyBRL())
                .foregroundColor(transaction.type == .credit ? .green : .red)
                .bold()
        }
    }
}

#Preview {
    TransactionRow(transaction: .init(id: UUID(), title: "Test", amount: 1000, date: Date(), type: .credit))
}
