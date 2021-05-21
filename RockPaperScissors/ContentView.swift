//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by David Bailey on 21/05/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var score = 0

    var body: some View {
        VStack {
            HStack {
                Text("Objective:")
                Text("Win")
                    .fontWeight(.black)
            }
            .font(.largeTitle)

            Spacer()

            VStack(spacing: 48) {
                VStack(spacing: 8) {
                    Text("Your opponent plays:")
                        .font(.headline)
                    HandIcon(move: .rock)
                        .font(.system(size: 128))
                }

                VStack(spacing: 8) {
                    Text("Your choices:")
                        .font(.headline)
                    HStack(spacing: 8) {
                        Button(action: {
                            score += 1
                        }) {
                            HandIcon(move: .rock)
                        }
                        Button(action: {
                            score += 1
                        }) {
                            HandIcon(move: .paper)
                        }
                        Button(action: {
                            score += 1
                        }) {
                            HandIcon(move: .scissors)
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
    }
}

enum GameMove: String {
    case rock
    case paper
    case scissors
}

struct HandIcon: View {
    var move: GameMove
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
            .accessibilityLabel(move.rawValue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
