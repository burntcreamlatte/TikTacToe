//
//  TikTacToeViewController.swift
//  TikTacToe
//
//  Created by Kyle Jennings on 12/18/19.
//  Copyright © 2019 Aaron Shackelford. All rights reserved.
//

import UIKit

class TikTacToeViewController: UIViewController {
  
  var xArray: [Int] = []
  var oArray: [Int] = []
  
  var turn: Bool = true
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // TikTacToe Button Pressed
  func buttonPressed(sender: UIButton) {
    if turn {
      xArray.append(sender.tag)
      if checkForWinner(array: xArray) {
        
      } else {
        changePlayer()
      }
    } else {
      oArray.append(sender.tag)
      if checkForWinner(array: oArray) {
        
      } else {
        changePlayer()
      }
    }
  }
  
  func checkForWinner(array: [Int]) -> Bool {
    let winningArrays = [[1,2,3], [1,5,9], [1,4,7], [2,5,8], [3,6,9], [3,5,7]]
    var count = 0
    for winningNumbers in winningArrays {
      for number in winningNumbers {
        if array.contains(number) {
          count += 1
        }
      }
    }
    if count >= 3 {
      return true
    } else {
      return false
    }
  }
  
  func changePlayer() {
    turn.toggle()
    // TODO Update Label
    if turn {
      // Player X
    } else {
      // Player O
    }
  }
  
  // New Game Button Pressed
  
  func newGame() {
    xArray = []
    oArray = []
    turn = true
    // TODO Update Label to Player X
  }
}
