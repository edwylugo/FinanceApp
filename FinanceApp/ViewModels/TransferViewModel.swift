//
//  TransferViewModel.swift
//  FinanceApp
//
//  Created by Edwy Lugo on 02/07/25.
//

import Foundation
import Combine

final class TransferViewModel: ObservableObject {
    @Published var recipientName: String = ""
    @Published var amountText: String = ""
    @Published var isLoading: Bool = false
    @Published var successMessage: String?
    @Published var errorMessage: String?

    private let api = MockAPIService.shared

    func performTransfer() {
        errorMessage = nil
        successMessage = nil
        isLoading = true

        guard let amount = Double(amountText.replacingOccurrences(of: ",", with: ".")) else {
            errorMessage = "Valor inválido."
            isLoading = false
            return
        }

        api.performTransfer(to: recipientName, amount: amount) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success:
                    self?.successMessage = "Transferência realizada com sucesso!"
                    self?.recipientName = ""
                    self?.amountText = ""
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
