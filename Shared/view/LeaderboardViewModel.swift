//
//  LeaderboardViewModel.swift
//  AppSUI08HW
//
//  Created by Konstantin Zaharev on 10.03.2022.
//

import SwiftUI

@MainActor
final class LeaderboardViewModel: ObservableObject {
    
    @Published var leadersList = [(Team, Int)]()
    
    func readLeadersList() async {
        leadersList = DataProvider.shared.leaderboard.sorted(by: { $0.1 > $1.1 })
    }
    
}
