//
//  DashboardViewModelTests.swift
//  FinanceAppTests
//
//  Created by Edwy Lugo on 03/07/25.
//

import XCTest
@testable import FinanceApp

final class DashboardViewModelTests: XCTestCase {
    func test_fetchDashboardData_shouldLoadAccountAndTransactions() {
        let viewModel = DashboardViewModel()
        let expectation = XCTestExpectation(description: "Load account and transactions")

        viewModel.fetchDashboardDataIfNeeded()

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertNotNil(viewModel.account)
            XCTAssertFalse(viewModel.transactions.isEmpty)
            XCTAssertFalse(viewModel.isLoading)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 2.0)
    }
}
