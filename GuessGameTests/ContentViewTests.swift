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
}
