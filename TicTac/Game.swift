//
//  Game.swift
//  TicTac
//
//  Created by Libranner Leonel Santos Espinal on 6/9/16.
//  Copyright © 2016 Libranner Leonel Santos Espinal. All rights reserved.
//

import UIKit

class Game: NSObject {
    let columns  = 3
    let rows = 3
    let brain: Brain
    let playerOne: String
    let playerTwo: String
    
    init(playerOne: String, playerTwo: String) {
        self.playerOne = playerOne
        self.playerTwo = playerTwo
        self.brain = Brain(centerCoordinate: Coordinate(1,1))
        super.init()
        start(columns, rows: rows)
    }
    
    func start(columns: Int, rows: Int){
        self.brain.board = [[State]](count: columns, repeatedValue:[State](count: rows, repeatedValue:State.Blank))
    }
    
    func move(state:State, coordinate: Coordinate) -> (moved: Bool, won: Bool, boxes: Array<Coordinate>?) {
        return self.brain.play(state, coordinate: coordinate)
    }
    
}
