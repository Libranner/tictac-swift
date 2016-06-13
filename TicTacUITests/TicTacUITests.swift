//
//  TicTacUITests.swift
//  TicTacUITests
//
//  Created by Libranner Leonel Santos Espinal on 6/9/16.
//  Copyright © 2016 Libranner Leonel Santos Espinal. All rights reserved.
//

import XCTest

class TicTacUITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func setUpMatch(){
        let app = XCUIApplication()
        app.textFields["playerOneTextField"].tap()
        app.textFields["playerOneTextField"].typeText("John")
        app.textFields["playerTwoTextField"].tap()
        app.textFields["playerTwoTextField"].typeText("Louis")
        app.buttons["startButton"].tap()
    }
    
    func testTapButtonOne (){
        setUpMatch()
        let app = XCUIApplication()
        let button = app.buttons["buttonOne"]
        button.tap()
        XCTAssertEqual(button.label, "X")
    }
    
    func testTapButtonTwo (){
        setUpMatch()
        let app = XCUIApplication()
        let button = app.buttons["buttonTwo"]
        button.tap()
        XCTAssertEqual(button.label, "X")
    }

    func testTapButtonThree (){
        setUpMatch()
        let app = XCUIApplication()
        let button = app.buttons["buttonThree"]
        button.tap()
        XCTAssertEqual(button.label, "X")
    }
    
    func testTapButtonFour (){
        setUpMatch()
        let app = XCUIApplication()
        let button = app.buttons["buttonFour"]
        button.tap()
        XCTAssertEqual(button.label, "X")
    }
    
    func testTapButtonFive (){
        setUpMatch()
        let app = XCUIApplication()
        let button = app.buttons["buttonFive"]
        button.tap()
        XCTAssertEqual(button.label, "X")
    }
    
    func testTapButtonSix (){
        setUpMatch()
        let app = XCUIApplication()
        let button = app.buttons["buttonSix"]
        button.tap()
        XCTAssertEqual(button.label, "X")
    }
    
    func testTapButtonSeven (){
        setUpMatch()
        let app = XCUIApplication()
        let button = app.buttons["buttonSeven"]
        button.tap()
        XCTAssertEqual(button.label, "X")
    }
    
    func testTapButtonEight (){
        setUpMatch()
        let app = XCUIApplication()
        let button = app.buttons["buttonEight"]
        button.tap()
        XCTAssertEqual(button.label, "X")
    }
    
    func testTapButtonNine (){
        setUpMatch()
        let app = XCUIApplication()
        let button = app.buttons["buttonNine"]
        button.tap()
        XCTAssertEqual(button.label, "X")
    }
}
