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

    @IBOutlet weak var playerOneTextField: UITextField!
    @IBOutlet weak var playerTwoTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func startGame(sender: UIButton) {
        guard let playerOne = playerOneTextField.text, playerTwo = playerTwoTextField.text else{
            return
        }
        start(playerOne: playerOne, playerTwo: playerTwo)
        [self.view .endEditing(true)]
    }
    
    func start(playerOne playerOne: String, playerTwo: String){
        game = Game(playerOne: playerOne, playerTwo: playerTwo)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTapped(sender: UIButton) {
        let coordinate =  getCoordinates(sender.tag)        
        let playResult = play(coordinate)
        
        if(playResult.moved){
            let symbol = (playResult.state == State.X) ? "X" : "O"
            sender.setTitle(symbol, forState: UIControlState.Normal)
        }
    }
    
    private func getCoordinates(value: Int) -> Coordinate{
        if value < 10 {
            return Coordinate(0, value)
        }
        
        return Coordinate(value/10, value % 10)
    }
    
    func play(coordinate: Coordinate) -> (moved: Bool, state: State?) {
        guard let unwrappedGame = game else {
            print("Game is nil")
            return (false, nil)
        }
        
        let state = (isPlayerOne) ? State.X : State.O
        let (moved, _) = unwrappedGame.move(state, coordinate: coordinate)
        if(moved){
            self.isPlayerOne = !self.isPlayerOne
            return (true, state)
        }
        return (moved, state)
    }
}

