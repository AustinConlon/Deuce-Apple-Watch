//
//  MatchDetail.swift
//  Deuce
//
//  Created by Austin Conlon on 5/8/20.
//  Copyright © 2020 Austin Conlon. All rights reserved.
//

import SwiftUI

struct MatchDetail: View {
    let match: Match
    
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    Image(systemName: "calendar")
                    Text(date())
                }
                
                Divider()
                
                HStack {
                    ForEach(match.sets, id: \.self) { set in
                        VStack {
                            Text(String(set.gamesWon[1]))
                            Text(String(set.gamesWon[0]))
                        }
                        .font(Font.largeTitle.monospacedDigit())
                    }
                }
                
                Divider()
                
                HStack {
                    Text(match.playerOneName ?? "You")
                        .frame(maxWidth: .infinity)
                    Text(match.playerTwoName ?? "Opponent")
                        .frame(maxWidth: .infinity)
                }
                
                HStack() {
                    VStack {
                        Text(String(match.totalPointsWon(by: .playerOne)))
                        Text(String(match.totalGamesWon(by: .playerOne)))
                        Text("\(match.playerOneBreakPointsWon)/\(match.playerOneBreakPointsPlayed)")
                        Text("\(match.playerOneServicePointsWon)/\(match.playerOneServicePointsPlayed)")
                        Text("\(match.playerOneReturnPointsWon)/\(match.playerTwoServicePointsPlayed)")
                    }
                    .padding(.leading)
                    
                    Spacer()
                    
                    VStack {
                        Text("Points Won")
                        Text("Games Won")
                        Text("Break Points Won/Played")
                        Text("Service Points Won/Played")
                        Text("Return Points Won/Played")
                    }
                    .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    VStack {
                        Text(String(match.totalPointsWon(by: .playerTwo)))
                        Text(String(match.totalGamesWon(by: .playerTwo)))
                        Text("\(match.playerTwoBreakPointsWon)/\(match.playerTwoBreakPointsPlayed)")
                        Text("\(match.playerTwoServicePointsWon)/\(match.playerTwoServicePointsPlayed)")
                        Text("\(match.playerTwoReturnPointsWon)/\(match.playerOneServicePointsPlayed)")
                    }
                    .padding(.trailing)
                }
                .padding(.top)
            }
        }
    }
    
    func date() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        return dateFormatter.string(from: match.date)
    }
}

struct MatchDetail_Previews: PreviewProvider {
    static var previews: some View {
        let randomlyGeneratedMatch = Match.random()
        return MatchDetail(match: randomlyGeneratedMatch)
            .preferredColorScheme(.dark)
    }
}
