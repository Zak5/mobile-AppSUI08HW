//
//  PlayViewModel.swift
//  AppSUI08HW
//
//  Created by Konstantin Zaharev on 09.03.2022.
//

import SwiftUI

@MainActor
final class PlayViewModel: ObservableObject {
    
    @Published var isOver: Bool = false
    @Published var who: Team?
    @Published var teamScores = [0, 0]

    private var winScore: Int = 10
    
    func incrementScore(team: Team) {
        switch team {
        case .one:
            teamScores[0] += 1
        case .two:
            teamScores[1] += 1
        }
        
        who = teamScores[0] == teamScores[1] ? nil : (teamScores[0] > teamScores[1] ? .one : .two)
        isOver = teamScores.contains(winScore)
        
        if let team = who, isOver {
            DataProvider.shared.addToLeaderboard(team)
        }
    }
    
    func startNewMatch() async {
        isOver = false
        who = nil
        teamScores = [0, 0]
        guard let settings = await DataProvider.shared.readSettings() else { return }
        winScore = settings.winScore
    }
    
}
