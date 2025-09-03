//
//  GameViewModelTests.swift
//  GuessGameTests
//
//  Created by Felipe Almeida on 03/09/25.
//

import XCTest
@testable import GuessGame // Importa seu projeto para ter acesso ao GameViewModel

final class GameViewModelTests: XCTestCase {

    var sut: GameViewModel! // sut (System Under Test) agora é o nosso ViewModel

    override func setUpWithError() throws {
        // Roda antes de cada teste, garantindo uma instância limpa
        sut = GameViewModel()
    }

    override func tearDownWithError() throws {
        // Roda depois de cada teste, limpando a memória
        sut = nil
    }

    // MARK: - Score Tests

    func test_check_correctAnswer_incrementsScore() {
        
        let initialScore = 5
        sut.score = initialScore
        sut.correctAnswer = 0
        
        sut.check(answer: 0)
        
        XCTAssertEqual(sut.score, initialScore + 1, "O score deveria ser incrementado em 1 após uma resposta correta.")
    }

    func test_check_incorrectAnswer_decrementsScore() {
        
        let initialScore = 5
        sut.score = initialScore
        sut.correctAnswer = 0
        
        sut.check(answer: 1)
        
        XCTAssertEqual(sut.score, initialScore - 1, "O score deveria ser decrementado em 1 após uma resposta incorreta.")
    }

    func test_check_incorrectAnswer_doesNotDecrementScoreBelowZero() {

        sut.score = 0
        sut.correctAnswer = 0
        
        sut.check(answer: 1)
        
        XCTAssertEqual(sut.score, 0, "O score não deveria ser menor que zero.")
    }

    // MARK: - Game Title Tests

    func test_check_updatesGameTitleToSuccessOnCorrectAnswer() {
        
        sut.correctAnswer = 2
        sut.check(answer: 2)
        
        XCTAssertEqual(sut.gameTitle, "Success!", "O título do jogo não foi atualizado para 'Success!'.")
    }
    
    func test_check_updatesGameTitleToFailedOnIncorrectAnswer() {
        
        sut.correctAnswer = 2
        sut.check(answer: 1)
        
        XCTAssertEqual(sut.gameTitle, "Failed", "O título do jogo não foi atualizado para 'Failed'.")
    }
    
    // MARK: - Game Subtitle Tests
    
    func test_check_updatesGameSubtitle_whenCorrectAnswerIsDog() {
        
        sut.correctAnswer = 0
        sut.check(answer: 1)
        
        XCTAssertEqual(sut.gameSubtitle, "Correct answer is dog", "O subtítulo para 'dog' está incorreto.")
    }
    
    func test_check_updatesGameSubtitle_whenCorrectAnswerIsCat() {
        
        sut.correctAnswer = 1
        sut.check(answer: 0)
        
        XCTAssertEqual(sut.gameSubtitle, "Correct answer is cat", "O subtítulo para 'cat' está incorreto.")
    }
    
    func test_check_updatesGameSubtitle_whenCorrectAnswerIsFox() {
    
        sut.correctAnswer = 2
        sut.check(answer: 0)
        
        XCTAssertEqual(sut.gameSubtitle, "Correct answer is fox", "O subtítulo para 'fox' está incorreto.")
    }
    
    // MARK: - Randomization Test
    
    func test_randomizeCorrectAnswer_setsValidNumber() {
        
        sut.randomizeCorrectAnswer()
        
        let validRange = 0...2
        XCTAssertTrue(validRange.contains(sut.correctAnswer), "A resposta aleatória não está no intervalo esperado [0, 2].")
    }
}
