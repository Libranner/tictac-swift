//
//  ViewController.swift
//  TicTac
//
//  Created by Libranner Leonel Santos Espinal on 6/9/16.
//  Copyright © 2016 Libranner Leonel Santos Espinal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var game: Game?
    var isPlayerOne: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func start(playerOne playerOne: String, playerTwo: String){
        game = Game(playerOne: playerOne, playerTwo: playerTwo)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func play(coordinate: Coordinate) {
        guard let unwrappedGame = game else {
            print("Game is nil")
            return
        }
        
        let state = (isPlayerOne) ? State.X : State.O
        let (moved, _) = unwrappedGame.move(state, coordinate: coordinate)
        if(moved){
            self.isPlayerOne = !self.isPlayerOne
        }
    }
}

