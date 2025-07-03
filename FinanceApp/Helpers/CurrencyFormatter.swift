//
//  CurrencyFormatter.swift
//  FinanceApp
//
//  Created by Edwy Lugo on 03/07/25.
//

import Foundation

extension Double {
    func asCurrencyBRL() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "BRL"
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter.string(from: NSNumber(value: self)) ?? "R$0,00"
    }
}
