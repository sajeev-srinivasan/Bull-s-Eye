//
//  BullsEyeTests.swift
//  BullsEyeTests
//
//  Created by Sajeev S on 07/09/22.
//

import XCTest
@testable import BullsEye

class BullsEyeTests: XCTestCase {
    var sut: GameController!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = GameController()
        sut.startNewGame()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testShouldUpdateRoundNumberForEachRound(){
        
        let num = sut.game.roundNumber
        let expected = num + 1
        
        sut.startNewRound()
        let actual = sut.game.roundNumber
        
        XCTAssertTrue(actual == expected)
        
    }
    
    func testShouldGetBonus100PointsIfCurrentValueIsExactAsTargetValue(){
        sut.game.target = 73
        sut.game.currentValue = 73
        let expected = 200
        
        let actual = sut.getPoints()
        
        XCTAssertTrue(actual == expected)
    }
    
    func testShouldGetBonus50PointsIfCurrentValueIsOneLessThanTargetValue(){
        sut.game.target = 73
        sut.game.currentValue = 72
        let expected = 149
        
        let actual = sut.getPoints()
        
        XCTAssertTrue(actual == expected)
    }
    
    func testShouldGetPointsIfCurrentValueIsSet(){
        sut.game.target = 73
        sut.game.currentValue = 70
        let expected = 97
        
        let actual = sut.getPoints()
        
        XCTAssertEqual(expected, actual)
    }
    
    func testShouldGetPerfectTitleIfCurrentValueIsOneLessThanTargetValue() {
        sut.game.target = 73
        sut.game.currentValue = 73
        let expected = "Perfect!"
        
        let actual = sut.getAlertTitle()
        
        XCTAssertEqual(expected, actual)
    }
    
    func testShouldGetAlmostHadItTitleIfCurrentValueIsOneLessThanTargetValue() {
        sut.game.target = 73
        sut.game.currentValue = 72
        let expected = "Almost had it"
        
        let actual = sut.getAlertTitle()
        
        XCTAssertEqual(expected, actual)
    }
    
}
