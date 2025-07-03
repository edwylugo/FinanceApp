//
//  MainTabView.swift
//  FinanceApp
//
//  Created by Edwy Lugo on 03/07/25.
//

import SwiftUI

struct MainTabView: View {
    @State private var didTransfer = false

    var body: some View {
        TabView {
            DashboardView(didTransfer: $didTransfer)
                .tabItem {
                    Label("Início", systemImage: "house.fill")
                }

            TransactionsView(didTransfer: $didTransfer)
                .tabItem {
                    Label("Histórico", systemImage: "list.bullet.rectangle.portrait")
                }
        }
    }
}

#Preview {
    MainTabView()
}
