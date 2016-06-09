//
//  Brain.swift
//  TicTac
//
//  Created by Libranner Leonel Santos Espinal on 6/9/16.
//  Copyright © 2016 Libranner Leonel Santos Espinal. All rights reserved.
//

import UIKit

class Brain: NSObject {
    var isPlayerOne = true
    
    func play() -> String{
        self.isPlayerOne = !self.isPlayerOne
        return (isPlayerOne) ? "X" : "0"
    }
}
