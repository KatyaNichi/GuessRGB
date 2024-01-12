//
//   IntroductoryView.swift
//  GuessRGB
//
//  Created by Ekaterina Nichiporenko on 2024-01-04.
//

import SwiftUI

struct IntroductoryView: View {
    @State private var isIntroductoryPresented = true
    var body: some View {
        ZStack {
                Color.black.edgesIgnoringSafeArea(.all) // Black background for the entire view
                
                VStack {
                    if isIntroductoryPresented {
                        Image("GissaFärgen")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200) //
                    } else {
                        ContentView(guess: RGB())
                    }
                }
            }
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { timer in
                    withAnimation {
                        isIntroductoryPresented = false
                    }
                }
            }
        }
    }

#Preview {
    IntroductoryView()
}
