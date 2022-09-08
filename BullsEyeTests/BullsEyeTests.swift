//
//  BullsEyeTests.swift
//  BullsEyeTests
//
//  Created by Sajeev S on 07/09/22.
//

import XCTest
@testable import BullsEye

class BullsEyeTests: XCTestCase {
    var sut: ViewController!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ViewController()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testShouldUpdateRoundNumberForEachRound(){
        
        let slider = UISlider()
        let targetLabel = UILabel()
        let scoreLabel = UILabel()
        let roundNumberLabel = UILabel()
        sut.slider = slider
        sut.targetLabel = targetLabel
        sut.scoreLabel = scoreLabel
        sut.roundNumberLabel = roundNumberLabel
        
        let expected = sut.roundNumber + 1
        
        sut.startNewRound()
        let actual = sut.roundNumber
        
        XCTAssertEqual(actual, expected)
    }
    
    func testShouldGetBonus100PointsIfTheCurrentValueIsExactAsTargetValue() {
        
        sut.target = 73
        sut.currentValue = 73
        
        let actual = sut.getPoints()
        let expected = 200
        
        XCTAssertEqual(expected, actual)
        
    }
    
    func testShouldGetBonus150PointsIfTheCurrentValueIsOneLessThanTargetValue() {
        
        sut.target = 37
        sut.currentValue = 36
        
        let actual = sut.getPoints()
        let expected = 149
        
        XCTAssertEqual(expected, actual)
        
    }
    
    func testShouldSetTitleWhenTheCurrentValueIsExactAsTargetValue() {
        
        sut.target = 73
        sut.currentValue = 73
        
        let actual = sut.getAlertTitle()
        let expected = "Perfect!"
        
        XCTAssertEqual(expected, actual)
    }
}
