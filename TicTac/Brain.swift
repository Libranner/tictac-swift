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
    
    func play(state:State, coordinate: Coordinate) -> (moved: Bool, won: Bool, boxes: Array<Coordinate>?) {
        guard getValueOnCoordinate(coordinate) != State.Blank else {
            self.board[coordinate.x][coordinate.y] = state
            let check = checkBoard(coordinate, state: state)
            return (true, check.won,check.boxes)
        }
        return (false, false, nil)
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
    
    
    private func checkColumn(column: Int, state: State) -> (won: Bool, boxes: Array<Coordinate>?){
        var boxes = Array<Coordinate>()
        for c in 0...2 {
            if(state != self.board[column][c]){
                return (false, nil)
            }
            else{
                boxes.append(Coordinate(column, c))
            }
        }
        return (true, boxes)
    }
    
    private func checkRow(row: Int, state: State) -> (won: Bool, boxes: Array<Coordinate>?){
        var boxes = Array<Coordinate>()
        for c in 0...2 {
            if(state != self.board[c][row]){
                return (false, nil)
            }
            else{
                boxes.append(Coordinate(c, row))
            }
        }
        return (true, boxes)
    }
    
    private func checkDiagonal(row: Int, column: Int, state: State) -> (won: Bool, boxes: Array<Coordinate>?)  {
        if(state != getValueOnCoordinate(centerCoordinate)){
            return (false, nil)
        }
        let max = self.board.count - 1
        
        if(self.board[0][max] == state && self.board[max][0] == state){
            return (true, [Coordinate(0,max), centerCoordinate, Coordinate(max,0)])
        }
        
        if(self.board[0][0] == state && self.board[max][max] == state){
            return (true, [Coordinate(0,0), centerCoordinate, Coordinate(max,max)])
        }
        
        return (false, nil)
    }
    
    
    func checkBoard(coordinate: Coordinate, state: State) -> (won: Bool, boxes: Array<Coordinate>?) {
        var (won, boxes) = checkRow(coordinate.y, state: state)
        
        if won {
            return (true, boxes)
        }
        
        (won, boxes) = checkColumn(coordinate.x, state: state)
        
        if won {
            return (true, boxes)
        }
        
        (won, boxes) = checkDiagonal(coordinate.y, column: coordinate.x, state: state)
        if won {
            return (true, boxes)
        }
        
        return (false, nil)
    }
}
