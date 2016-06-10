//
//  GameTests.swift
//  TicTac
//
//  Created by Libranner Leonel Santos Espinal on 6/9/16.
//  Copyright © 2016 Libranner Leonel Santos Espinal. All rights reserved.
//

import XCTest
@testable import TicTac

class GameTests: XCTestCase {
    let game = Game()
    
    override func setUp() {
        super.setUp()
        game.start(3, rows: 3)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGameboardIsEmptyWhenGameStart(){
        XCTAssertEqual(game.brain.board.count, 3)
    }
    
    func testGameboardIsAffectedByPlay(){
        let coordinate = Coordinate(1,1)
        game.move(State.X, coordinate: coordinate)
        let box = game.brain.getValueOnCoordinate(coordinate)!
        
        XCTAssertEqual(box, State.X)
    }    
}
