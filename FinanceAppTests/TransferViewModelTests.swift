//
//  TransferViewModelTests.swift
//  FinanceAppTests
//
//  Created by Edwy Lugo on 03/07/25.
//

import XCTest
@testable import FinanceApp

final class TransferViewModelTests: XCTestCase {
    func test_performTransfer_withValidData_shouldSucceed() {
        let viewModel = TransferViewModel()
        viewModel.recipientName = "Maria"
        viewModel.amountText = "100"

        let expectation = XCTestExpectation(description: "Transfer success")

        viewModel.performTransfer()

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(viewModel.successMessage, "Transferência realizada com sucesso!")
            XCTAssertNil(viewModel.errorMessage)
            XCTAssertEqual(viewModel.recipientName, "")
            XCTAssertEqual(viewModel.amountText, "")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 2.0)
    }

    func test_performTransfer_withInvalidAmount_shouldFail() {
        let viewModel = TransferViewModel()
        viewModel.recipientName = "Maria"
        viewModel.amountText = "abc"

        viewModel.performTransfer()

        XCTAssertEqual(viewModel.errorMessage, "Valor inválido.")
    }
}
