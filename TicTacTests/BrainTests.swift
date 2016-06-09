//
//  BrainTests.swift
//  TicTac
//
//  Created by Libranner Leonel Santos Espinal on 6/9/16.
//  Copyright © 2016 Libranner Leonel Santos Espinal. All rights reserved.
//

import XCTest
@testable import TicTac

class BrainTests: XCTestCase {
    let brain = Brain()
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testWhenGameStarsIsPlayerOneTurn(){
        XCTAssertEqual(brain.isPlayerOne, true);
    }
    
    func testBrainKeepTrackOfPlayer(){
        let firstPlay = brain.play()
        let secondPlay = brain.play()
        XCTAssertNotEqual(firstPlay, secondPlay)
    }
    
}
