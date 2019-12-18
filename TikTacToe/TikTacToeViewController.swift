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
  // Buttons
  @IBOutlet weak var firstButton: UIButton!
  @IBOutlet weak var secondButton: UIButton!
  @IBOutlet weak var thirdButton: UIButton!
  @IBOutlet weak var fourthButton: UIButton!
  @IBOutlet weak var fifthButton: UIButton!
  @IBOutlet weak var sixthButton: UIButton!
  @IBOutlet weak var seventhButton: UIButton!
  @IBOutlet weak var eighthButton: UIButton!
  @IBOutlet weak var ninthButton: UIButton!
  
  // MARK: - Properties
  var xArray: Set<Int> = []
  var oArray: Set<Int> = []
  
  var turn: Bool = true
  
  var count = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    newGame()
  }
  
  // TikTacToe Button Pressed
  @IBAction func tikTacButtonPressed(_ sender: UIButton) {
    count += 1
    if turn {
      xArray.insert(sender.tag)
      sender.setImage(UIImage(named: "cross"), for: .normal)
      sender.isEnabled = false
      if checkForWinner(array: xArray) == true {
        wonLabel.text = "X Won!"
        turnLabel.text = ""
      } else {
        changePlayer()
      }
    } else {
      oArray.insert(sender.tag)
      sender.setImage(UIImage(named: "nought"), for: .normal)
      sender.isEnabled = false
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
        enableOrDisableButtons(state: false)
        tie()
        return true
      }
    }
    
    tie()
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
    count = 0
    xArray = []
    oArray = []
    turn = true
    turnLabel.text = "X's turn"
    wonLabel.text = ""
    updateButtons()
  }
  
  func updateButtons() {
    firstButton.setImage(nil, for: .normal)
    secondButton.setImage(nil, for: .normal)
    thirdButton.setImage(nil, for: .normal)
    fourthButton.setImage(nil, for: .normal)
    fifthButton.setImage(nil, for: .normal)
    sixthButton.setImage(nil, for: .normal)
    seventhButton.setImage(nil, for: .normal)
    eighthButton.setImage(nil, for: .normal)
    ninthButton.setImage(nil, for: .normal)
    enableOrDisableButtons(state: true)
  }
  
  func enableOrDisableButtons(state: Bool) {
    firstButton.isEnabled = state
    secondButton.isEnabled = state
    thirdButton.isEnabled = state
    fourthButton.isEnabled = state
    fifthButton.isEnabled = state
    sixthButton.isEnabled = state
    seventhButton.isEnabled = state
    eighthButton.isEnabled = state
    ninthButton.isEnabled = state
  }
  
  func tie() {
    if count == 9 {
      wonLabel.text = "Tie!"
      turnLabel.text = ""
    }
  }
}
