//
//  DataProvider.swift
//  AppSUI08HW
//
//  Created by Konstantin Zaharev on 09.03.2022.
//

import Foundation

class DataProvider {

    static let shared = DataProvider()
    
    var winScore = 10
    private(set) var leaderboard = [Team: Int]()
    private var settings: Settings?
    
    func addToLeaderboard(_ team: Team) {
        let wins = leaderboard[team] ?? 0
        leaderboard[team] = wins + 1
    }
    
    func readSettings() async -> Settings? {
        return settings
    }
    
    func writeSettings(_ settings: Settings) async {
        self.settings = settings
    }
    
}
