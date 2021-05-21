//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by David Bailey on 21/05/2021.
//

import SwiftUI

struct ContentView: View {
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
                    Text("✊")
                        .accessibilityLabel("rock")
                        .font(.system(size: 128))
                }

                VStack(spacing: 8) {
                    Text("Your choices:")
                        .font(.headline)
                    HStack(spacing: 8) {
                        Button("✊") {}
                            .accessibilityLabel("rock")
                        Button("🖐") {}
                            .accessibilityLabel("paper")
                        Button("✌️") {}
                            .accessibilityLabel("scissors")
                    }
                    .font(.system(size: 64))
                }
            }

            Spacer()

            HStack {
                Text("Score:")
                Text("0")
                    .fontWeight(.black)
            }
            .font(.largeTitle)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
