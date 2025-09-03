//
//  ContentView.swift
//  GuessGame
//
//  Created by Felipe Almeida on 02/09/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var correctAnswer = 0
    @State var score = 0
    @State var gameTitle = "?"
    @State var gameSubtitle = ""
    
    var body: some View {
        VStack {
            Text(gameTitle)
                .font(.system(size: 40, weight: .semibold))
                .padding(.top, 100)
            Text(gameSubtitle)
                .font(.system(size: 20))
                .padding(.bottom, 100)
            
            HStack {
                Spacer()
                Text("Score \(score)")
                    .font(.system(size: 15, weight: .semibold))
            }
        }
        .padding()
    }
    
    func check(){}
}

#Preview {
    ContentView()
}
