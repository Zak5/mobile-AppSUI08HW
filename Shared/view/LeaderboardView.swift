//
//  LeaderboardView.swift
//  AppSUI08HW
//
//  Created by Konstantin Zaharev on 07.03.2022.
//

import SwiftUI

struct LeaderboardView: View {
    
    @StateObject var viewModel: LeaderboardViewModel = .init()
    
    var body: some View {
        List {
            ForEach(viewModel.leadersList, id: \.0) { leader in
                HStack {
                    Text(leader.0.name)
                    Spacer()
                    Text(String(leader.1))
                }
            }
        }
        .task {
            await viewModel.readLeadersList()
        }
    }
}
