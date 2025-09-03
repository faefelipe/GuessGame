//
//  ContentView.swift
//  GuessGame
//
//  Created by Felipe Almeida on 02/09/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        VStack {
            Text(viewModel.gameTitle)
                .font(.system(size: 40, weight: .semibold))
                .padding(.top, 100)
            Text(viewModel.gameSubtitle)
                .font(.system(size: 20))
                .padding(.bottom, 100)
            
            HStack {
                Spacer()
                Text("Score \(viewModel.score)")
                    .font(.system(size: 15, weight: .semibold))
            }
            Button(action: {
                viewModel.check(answer: 0)
            },label: {
                Image("dog")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            })
            
            Button(action: {
                viewModel.check(answer: 1)
            },label: {
                Image("cat")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            })
            
            Button(action: {
                viewModel.check(answer: 2)
            },label: {
                Image("fox")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            })
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
