//
//  GuessGameTests.swift
//  GuessGameTests
//
//  Created by Felipe Almeida on 02/09/25.
//

import XCTest
import SwiftUI
@testable import GuessGame

@MainActor
final class ContentViewTests: XCTestCase {

    var sut: ContentView!
    
    override func setUpWithError() throws {
        sut = ContentView()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    // --- Testes para a lógica da função 'check(answer:)'
    
    func test_check_correctAnswer_incrementsScore() {
        sut.correctAnswer = 1
        
        sut.check(answer: 1)
        
        XCTAssertEqual(sut.score, 1, "O score deveria ser incrementado para 1 após uma resposta correta.")
    }
    
    func test_check_incorrectAnswer_decrementsScore() {
        sut.correctAnswer = 0
        sut.score = 5
        
        sut.check(answer: 1)
        
        XCTAssertEqual(sut.score, 4, "O score deveria ser decrementado para 4 após uma resposta incorreta.")
    }
    
    func test_check_incorrectAnswer_doesNotDecrementScoreBelowZero() {
     
        sut.correctAnswer = 0
        sut.score = 0
        
        sut.check(answer: 1)
        
        XCTAssertEqual(sut.score, 0, "O score não deveria ser menor que zero.")
    }

    // --- Testes para as mudanças de estado da View ---
    
    func test_check_updatesGameTitleToSuccessOnCorrectAnswer() {
     
        sut.correctAnswer = 2
        
        sut.check(answer: 2)
        
        XCTAssertEqual(sut.gameTitle, "Success!", "O título do jogo não foi atualizado corretamente para 'Success!'.")
    }
    
    func test_check_updatesGameTitleToFailedOnIncorrectAnswer() {
        
        sut.correctAnswer = 2
        
        sut.check(answer: 1)
        
        XCTAssertEqual(sut.gameTitle, "Failed", "O título do jogo não foi atualizado corretamente para 'Failed'.")
    }
    
    func test_check_updatesGameSubtitleCorrectly() {
     
        sut.correctAnswer = 0
        sut.check(answer: 1)
        XCTAssertEqual(sut.gameSubtitle, "Correct answer is dog", "A legenda da resposta correta para 'dog' está incorreta.")
             
        sut.correctAnswer = 1
        sut.check(answer: 0)
        XCTAssertEqual(sut.gameSubtitle, "Correct answer is cat", "A legenda da resposta correta para 'cat' está incorreta.")
     
        sut.correctAnswer = 2
        sut.check(answer: 0)
        XCTAssertEqual(sut.gameSubtitle, "Correct answer is fox", "A legenda da resposta correta para 'fox' está incorreta.")
    }
    
    // --- Teste para a função 'randomizeCorrectAnswer()' ---
    
    func test_randomizeCorrectAnswer_setsValidNumber() {
     
        sut.randomizeCorrectAnswer()
        
        XCTAssertTrue(sut.correctAnswer >= 0 && sut.correctAnswer <= 2, "O valor aleatório não está no intervalo esperado (0, 1, 2).")
    }
    
}
