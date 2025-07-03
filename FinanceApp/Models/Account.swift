//
//  Account.swift
//  FinanceApp
//
//  Created by Edwy Lugo on 02/07/25.
//

import Foundation

struct Account: Identifiable, Codable {
    let id: UUID
    let ownerName: String
    var balance: Double
}
