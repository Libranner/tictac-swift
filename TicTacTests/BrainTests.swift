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
    let brain = Brain(centerCoordinate: Coordinate(1,1))
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPlayChangeValueOfBox(){
        let coordinate = Coordinate(0,2)
        brain.play(State.O, coordinate: coordinate)
        let box = brain.getValueOnCoordinate(coordinate)

        XCTAssertEqual(box, State.O)
    }
    
    func testUserWinsHorrizontally(){
        brain.play(State.O, coordinate: Coordinate(0,0))
        brain.play(State.X, coordinate: Coordinate(1,1))
        brain.play(State.O, coordinate: Coordinate(2,0))
        brain.play(State.X, coordinate: Coordinate(2,2))
        let result = brain.play(State.O, coordinate: Coordinate(1,0))
        XCTAssertNotNil(result.boxes)
        XCTAssertEqual(result.won, true)
    }
    
    func testUserWinsVertically(){
        brain.play(State.O, coordinate: Coordinate(1,1))
        brain.play(State.O, coordinate: Coordinate(1,2))
        let result = brain.play(State.O, coordinate: Coordinate(1,0))
        XCTAssertNotNil(result.boxes)
        XCTAssertEqual(result.won, true)
    }
    
    func testUserWinsDiagonally(){
        brain.play(State.O, coordinate: Coordinate(0,0))
        brain.play(State.O, coordinate: Coordinate(1,1))
        let result = brain.play(State.O, coordinate: Coordinate(2,2))
        XCTAssertNotNil(result.boxes)
        XCTAssertEqual(result.won, true)
    }
}
