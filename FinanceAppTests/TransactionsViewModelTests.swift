//
//  TransactionsViewModelTests.swift
//  FinanceAppTests
//
//  Created by Edwy Lugo on 03/07/25.
//

import XCTest
@testable import FinanceApp

final class TransactionsViewModelTests: XCTestCase {
    func test_fetchTransactions_shouldLoadData() {
        let viewModel = TransactionsViewModel()
        let expectation = XCTestExpectation(description: "Transactions loaded")

        viewModel.fetchTransactions()

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertFalse(viewModel.transactions.isEmpty)
            XCTAssertFalse(viewModel.isLoading)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 2.0)
    }
}
