//
//  TikTacToeViewController.swift
//  TikTacToe
//
//  Created by Kyle Jennings on 12/18/19.
//  Copyright © 2019 Aaron Shackelford. All rights reserved.
//

import UIKit

class TikTacToeViewController: UIViewController {
  
  // MARK: - Outlets
  @IBOutlet weak var turnLabel: UILabel!
  @IBOutlet weak var wonLabel: UILabel!
  
  
  var xArray: Set<Int> = []
  var oArray: Set<Int> = []
  
  var turn: Bool = true
  
  override func viewDidLoad() {
    super.viewDidLoad()
    newGame()
  }
  
  // TikTacToe Button Pressed
  @IBAction func tikTacButtonPressed(_ sender: UIButton) {
    if turn {
      xArray.insert(sender.tag)
      sender.setImage(.add, for: .normal)
      print(xArray)
      if checkForWinner(array: xArray) == true {
        wonLabel.text = "X Won!"
        turnLabel.text = ""
      } else {
        changePlayer()
      }
    } else {
      oArray.insert(sender.tag)
      sender.setImage(.checkmark, for: .normal)
      if checkForWinner(array: oArray) {
        wonLabel.text = "O Won!"
        turnLabel.text = ""
      } else {
        changePlayer()
      }
    }
  }
  
  func checkForWinner(array: Set<Int>) -> Bool {
    let winningSet: Set<Set<Int>> = [[1,2,3], [1,5,9], [1,4,7], [2,5,8], [3,6,9], [3,5,7]]
    
    for combo in winningSet {
      if array.intersection(combo).sorted() == combo.sorted() {
        return true
      }
    }
    return false
  }
  
  func changePlayer() {
    turn.toggle()
    if turn {
      turnLabel.text = "X's turn"
    } else {
      turnLabel.text = "O's turn"
    }
  }
  
  // New Game Button Pressed
  
  @IBAction func newGameButtonPressed(_ sender: UIButton) {
    newGame()
  }
  
  func newGame() {
    xArray = []
    oArray = []
    turn = true
    turnLabel.text = "X's turn"
    wonLabel.text = ""
  }
}
