// GameViewModel.swift

import Foundation


class GameViewModel: ObservableObject {
    
    @Published var correctAnswer = 0
    @Published var score = 0
    @Published var gameTitle = "?"
    @Published var gameSubtitle = ""

    init() {
        randomizeCorrectAnswer()
    }

    func check(answer: Int) {
        if answer == correctAnswer {
            score += 1
            gameTitle = "Success!"
            gameSubtitle = "Correct answer is \(getAnimalName(for: correctAnswer))"
        } else {
            if score != 0 {
                score -= 1
            }
            gameTitle = "Failed"
            gameSubtitle = "Correct answer is \(getAnimalName(for: correctAnswer))"
        }
        randomizeCorrectAnswer()
    }
    
    func getAnimalName(for answer: Int) -> String {
        if answer == 0 {
            return "dog"
        } else if answer == 1 {
            return "cat"
        } else if answer == 2 {
            return "fox"
        } else {
            return ""
        }
    }
        
    func randomizeCorrectAnswer() {
        let randomCorrectAnswer = Int.random(in: 0..<3)
        correctAnswer = randomCorrectAnswer
    }
}
