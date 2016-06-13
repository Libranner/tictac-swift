//
//  ViewControllerTests.swift
//  TicTac
//
//  Created by Libranner Leonel Santos Espinal on 6/13/16.
//  Copyright © 2016 Libranner Leonel Santos Espinal. All rights reserved.
//

import XCTest
@testable import TicTac

class ViewControllerTests: XCTestCase {
    var viewController : ViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        viewController = storyboard.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
        UIApplication.sharedApplication().keyWindow!.rootViewController = viewController
        
        let _ = viewController.view
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testStartGame(){
        viewController.start(playerOne: "John", playerTwo: "Louis")
        XCTAssertNotNil(viewController.game)
    }
    
    func testPlayerOnePlay(){
        viewController.start(playerOne: "John", playerTwo: "Louis")
        let state =  State.X
        let coordinate =  Coordinate(1,1)
        viewController.play(coordinate)
        XCTAssertEqual(viewController.isPlayerOne, false)
        XCTAssertEqual(viewController.game?.brain.getValueOnCoordinate(coordinate), state)
    }
    
    func testPlayerTwoPlay(){
        viewController.start(playerOne: "John", playerTwo: "Louis")
        viewController.play(Coordinate(1,1))
        
        let coordinate =  Coordinate(0,1)
        viewController.play(coordinate)
        XCTAssert(viewController.isPlayerOne)
        
        XCTAssertEqual(viewController.game?.brain.getValueOnCoordinate(coordinate), State.O)
    }
    
    func testPlayerTryToPlayOnAnInvalidBox(){
        viewController.start(playerOne: "John", playerTwo: "Louis")
        let coordinate =  Coordinate(0,1)
        viewController.play(coordinate)
        viewController.play(coordinate)
        XCTAssertEqual(viewController.isPlayerOne, false)
        XCTAssertEqual(viewController.game?.brain.getValueOnCoordinate(coordinate), State.X)
    }
    
}
