//
//  PlayView.swift
//  AppSUI08HW
//
//  Created by Konstantin Zaharev on 07.03.2022.
//

import SwiftUI

struct PlayView: View {
    
    @StateObject var viewModel: PlayViewModel = .init()
    @State var prize = 0.0
    
    var body: some View {
        VStack {
            HStack {
                // one
                VStack {
                    Text("Me")
                        .font(.headline)
                    Image(systemName: "circle.fill")
                        .foregroundColor(viewModel.who == .one ? .red : .clear)
                    Button { viewModel.incrementScore(team: .one) }
                label: {
                    Image(systemName: "\(viewModel.teamScores[0]).circle.fill")
                        .font(.largeTitle)
                }
                }
                // two
                VStack {
                    Text("Opponent")
                        .font(.headline)
                    Image(systemName: "circle.fill")
                        .foregroundColor(viewModel.who == .two ? .red : .clear)
                    Button { viewModel.incrementScore(team: .two) }
                label: {
                    Image(systemName: "\(viewModel.teamScores[1]).circle.fill")
                        .font(.largeTitle)
                }
                }
            } // HStack
            Spacer()
#if os(iOS)
            Text("Prize $\(prize.roundedString(2))")
#else
            Text("Prize $\(prize.roundedString(2))")
                .focusable()
                .digitalCrownRotation($prize, from: 0, through: 20, by: 0.10)
#endif
        }.alert(isPresented: $viewModel.isOver) {
            Alert(title: Text("Finish"),
                  message: Text("Winner is player \(viewModel.who == .one ? "one" : "two")"),
                  dismissButton: .default(Text("Reset")) {
                Task {
                    await viewModel.startNewMatch()
                }
                
            }
            )
        }.task {
            await viewModel.startNewMatch()
        }
        
    }
    
    
}

private extension Double {
    
    func roundedString(_ places: Int) -> String {
        String(format: "%.\(places)f", self)
    }
    
}
