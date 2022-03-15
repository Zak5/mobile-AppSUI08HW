//
//  SettingsViewModel.swift
//  AppSUI08HW
//
//  Created by Konstantin Zaharev on 10.03.2022.
//

import SwiftUI

@MainActor
final class SettingsViewModel: ObservableObject {
    
    @Published var winScore = "" {
        didSet {
            Task {
                let filtered = winScore.filter { $0.isNumber }
                
                if winScore != filtered {
                    winScore = filtered
                }
                
                if let winScoreInt = Int(winScore) {
                    await DataProvider.shared.writeSettings(Settings(winScore: winScoreInt))
                }
            }
        }
    }

    func readSettings() async {
        guard let settings = await DataProvider.shared.readSettings() else { return }
        winScore = String(settings.winScore)
    }
    
}
