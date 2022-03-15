//
//  ContentView.swift
//  Shared
//
//  Created by Konstantin Zaharev on 28.02.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            NavigationLink(destination: PlayView()) {
                Text("Play")
            }
             NavigationLink(destination: SettingsView()) {
                Text("Settings")
            }
            NavigationLink(destination: LeaderboardView()) {
                Text("Leaderboard")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
