//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by David Bailey on 21/05/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var score = 0
    @State private var turn = 0

    @State private var opponentMove = GameMove.allCases.randomElement()!
    @State private var shouldWin = Bool.random()
    @State private var shuffledMoves = GameMove.allCases.shuffled()

    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""

    var promptText: String {
        "Choose the \(shouldWin ? "winning" : "losing") move:"
    }

    var body: some View {
        VStack {
            HStack {
                Text("Objective:")
                Text(shouldWin ? "Win" : "Lose")
                    .fontWeight(.black)
            }
            .font(.largeTitle)

            Spacer()

            VStack(spacing: 48) {
                VStack(spacing: 8) {
                    Text("Your opponent plays:")
                        .font(.headline)
                    HandIcon(move: opponentMove, turn: turn)
                        .font(.system(size: 128))
                }

                VStack(spacing: 8) {
                    Text(promptText)
                        .font(.headline)

                    HStack(spacing: 8) {
                        ForEach(shuffledMoves) { move in
                            Button(action: {
                                moveTapped(move)
                            }) {
                                HandIcon(move: move, turn: turn)
                            }
                        }
                    }
                    .font(.system(size: 64))
                }
            }

            Spacer()

            HStack {
                Text("Score:")
                Text("\(score)")
                    .fontWeight(.black)
            }
            .font(.largeTitle)
        }
        .padding()
        .alert(isPresented: $showingAlert, content: {
            Alert(
                title: Text(alertTitle),
                message: Text(alertMessage),
                dismissButton: .default(Text("Next question")) {
                    nextQuestion()
                }
            )
        })
    }

    func moveTapped(_ move: GameMove) {
        let correctMove = shouldWin ?
            getWinningMove(for: opponentMove) :
            getLosingMove(for: opponentMove)

        if move == correctMove {
            score += 1
            alertTitle = "Correct!"
            alertMessage = "The correct move is \(correctMove)."
        } else {
            alertTitle = "Incorrect!"
            alertMessage = "The correct move was \(correctMove)."
        }

        showingAlert = true
    }

    func nextQuestion() {
        turn += 1
        opponentMove = GameMove.allCases.randomElement()!
        shouldWin = Bool.random()
        shuffledMoves.shuffle()
    }
}

enum GameMove: String, CaseIterable, Identifiable {
    case rock
    case paper
    case scissors

    var id: String { rawValue }
}

func getWinningMove(for move: GameMove) -> GameMove {
    switch move {
    case .rock: return .paper
    case .paper: return .scissors
    case .scissors: return .rock
    }
}

func getLosingMove(for move: GameMove) -> GameMove {
    switch move {
    case .rock: return .scissors
    case .paper: return .rock
    case .scissors: return .paper
    }
}

struct HandIcon: View {
    var move: GameMove
    var turn: Int
    @State private var skinTone = Int.random(in: 0 ..< 5)

    var emoji: String {
        switch move {
        case .rock:
            return ["✊🏻", "✊🏼", "✊🏽", "✊🏾", "✊🏿"][skinTone]
        case .paper:
            return ["🖐🏻", "🖐🏼", "🖐🏽", "🖐🏾", "🖐🏿"][skinTone]
        case .scissors:
            return ["✌🏻", "✌🏼", "✌🏽", "✌🏾", "✌🏿"][skinTone]
        }
    }

    var body: some View {
        Text(emoji)
            .onChange(of: turn) { _ in
                // randomise skin tone with each turn
                skinTone = Int.random(in: 0 ..< 5)
            }
            .accessibilityLabel(move.rawValue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
