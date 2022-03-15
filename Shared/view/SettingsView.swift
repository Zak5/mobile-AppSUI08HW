//
//  SettingsView.swift
//  AppSUI08HW
//
//  Created by Konstantin Zaharev on 07.03.2022.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject var viewModel: SettingsViewModel = .init()
    
    var body: some View {
        List {
#if os(iOS)
            TextField("Win score", text: $viewModel.winScore)
                .padding()
                .keyboardType(.decimalPad)
#else
            TextField("Win score", text: $viewModel.winScore)
#endif
        }.task {
            await viewModel.readSettings()
        }
    }
}
