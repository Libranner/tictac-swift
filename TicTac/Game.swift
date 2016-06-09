//
//  Game.swift
//  TicTac
//
//  Created by Libranner Leonel Santos Espinal on 6/9/16.
//  Copyright © 2016 Libranner Leonel Santos Espinal. All rights reserved.
//

import UIKit

class Game: NSObject {
    var board = [[String]](count: 3, repeatedValue:[String](count: 3, repeatedValue:String()))
    
    override init() {
        super.init()
        start()
    }
    
    func start(){
        self.board = [[String]](count: 3, repeatedValue:[String](count: 3, repeatedValue:String()))
    }
    
    func play(isFirstPlayer: Bool, coordinate: Coordinate){
        self.board[coordinate.x][coordinate.y] = (isFirstPlayer) ? "X" : "O"
    }
    
    func getValueOnCoordinate(coordinate: Coordinate) throws -> String{
        if checkCoordinate(coordinate) {
            return self.board[coordinate.x][coordinate.y]
        }
        throw GameError.IndexOutOfRange
    }
    
    func checkCoordinate(coordinate: Coordinate) -> Bool {
        return (coordinate.x >= 0 && coordinate.x < 3 && coordinate.y >= 0 && coordinate.y < 3)
    }
    
    func isGameOver() -> Bool{
        var hasWon = false
        for index in 0...2 {
            var row = self.board[0]
            var row3 = self.board[1]
            var row2 = self.board[2]
            
            
            
            if(row[0] == row[1] && row[0] == row[2]){
                hasWon = true
                break
            }
        }
        
        if(!hasWon){
            
        }
        
        return true
    }
}
