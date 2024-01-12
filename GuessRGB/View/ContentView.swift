//
//  ContentView.swift
//  GuessRGB
//
//  Created by Ekaterina Nichiporenko on 2023-12-10.
//

import SwiftUI

struct ContentView: View {
    @State var game = Game()
    @State var guess: RGB
    @State var showScore = false
    var target = RGB.random()
    var body: some View {
        VStack {
            HStack {
                   Text("Runda: \(game.round)")
                       .font(.headline)
                       .foregroundColor(Color.white)
                       .padding(.bottom, 20)
                   
                   Spacer() // Add Spacer to push the total score to the right edge
                   
                   Text("Totalpoäng: \(game.scoreTotal)")
                       .font(.headline)
                       .foregroundColor(Color.white)
                       .padding(.bottom, 20)
               }
            Circle()
              .fill(Color(rgbStruct: game.target))
            if !showScore {
              Text("R: ??? G: ??? B: ???")
                .padding()
            } else {
              Text(game.target.intString())
                .padding()
            }
            Circle()
              .fill(Color(rgbStruct: guess))
           
            Text(guess.intString())
            ColorSlider(value: $guess.red, trackColor: .red)
            ColorSlider(value: $guess.green, trackColor: .green)
            ColorSlider(value: $guess.blue, trackColor: .blue)
            Button(action: {
                showScore = true
                game.check(guess: guess)
            }) {
                Text("Klicka på mig!")
                    .foregroundColor(.white) // Change to the color you want
            
            }.alert(isPresented: $showScore) {
                Alert(
                  title: Text("Dina Poäng"),
                  message: Text(String(game.scoreRound)),
                  dismissButton: .default(Text("OK")) {
                    game.startNewRound()
                    guess = RGB()
                  })
              }
        }
        .padding()
    }
    }

#Preview {
    ContentView(guess: RGB())
}

struct ColorSlider: View {
    @Binding var value: Double
    var trackColor: Color
    var body: some View {
        
        HStack {
            Text("0")
            Slider(value: $value)
                .accentColor(trackColor)
            Text("255")
        }
        .padding()
    }
}
