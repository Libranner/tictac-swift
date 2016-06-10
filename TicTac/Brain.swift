//
//  Brain.swift
//  TicTac
//
//  Created by Libranner Leonel Santos Espinal on 6/9/16.
//  Copyright © 2016 Libranner Leonel Santos Espinal. All rights reserved.
//

import UIKit

class Brain: NSObject {
    var centerCoordinate = Coordinate(1, 1)
    var board = [[State]](count: 3, repeatedValue:[State](count: 3, repeatedValue:State.Blank))
    
    
    init(centerCoordinate: Coordinate) {
        super.init()
        self.centerCoordinate = centerCoordinate
    }
    
    func play(state:State, coordinate: Coordinate) -> Bool {
        guard getValueOnCoordinate(coordinate) != State.Blank else {
            self.board[coordinate.x][coordinate.y] = state
            return isGameOver(coordinate, state: state)
        }
        return false
    }
    
    func getValueOnCoordinate(coordinate: Coordinate) -> State?{
        if checkCoordinate(coordinate) {
            return self.board[coordinate.x][coordinate.y]
        }
        return nil
    }
    
    private func checkCoordinate(coordinate: Coordinate) -> Bool {
        return (coordinate.x >= 0 && coordinate.x < 3 && coordinate.y >= 0 && coordinate.y < 3)
    }
    
    
    private func checkColumn(column: Int, state: State) -> Bool{
        for c in 0...2 {
            if(state != self.board[column][c]){
                return false
            }
        }
        return true
    }
    
    private func checkRow(row: Int, state: State) -> Bool{
        for c in 0...2 {
            if(state != self.board[c][row]){
                return false
            }
        }
        return true
    }
    
    private func checkDiagonal(row: Int, column: Int, state: State) -> Bool {
        if(state != getValueOnCoordinate(centerCoordinate)){
            return false
        }
        let max = self.board.count - 1
        
        if(self.board[0][max] == state && self.board[max][0] == state){
            return true
        }
        
        if(self.board[0][0] == state && self.board[max][max] == state){
            return true
        }
        
        return true
    }
    
    
    func isGameOver(coordinate: Coordinate, state: State) -> Bool{
        return checkRow(coordinate.y, state: state) || checkColumn(coordinate.x, state: state) || checkDiagonal(coordinate.y, column: coordinate.x, state: state)
    }
}
