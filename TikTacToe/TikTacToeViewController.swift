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
  
  var buttonArray: [UIButton] = []
  
  // MARK: - Properties
  var xArray: Set<Int> = []
  var oArray: Set<Int> = []
  
  var turn: Bool = true
  
  var count = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    buttonArray = [firstButton, secondButton, thirdButton, fourthButton, fifthButton, sixthButton, seventhButton, eighthButton, ninthButton]
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
        showWinLabel()
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
        showWinLabel()
        wonLabel.text = "O Won!"
        turnLabel.text = ""
      } else {
        changePlayer()
      }
    }
  }
  
  func checkForWinner(array: Set<Int>) -> Bool {
    let winningSet: Set<Set<Int>> = [[1,2,3], [1,5,9], [1,4,7], [2,5,8], [3,6,9], [3,5,7], [4,5,6], [7,8,9]]
    
    for combo in winningSet {
      if array.intersection(combo).sorted() == combo.sorted() {
        enableOrDisableButtons(state: false)
        tie()
        showWinLabel()
        updateWinningButton(buttons: combo.sorted())
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
    buttonArray.forEach{$0.tintColor = .systemBlue}
    count = 0
    xArray = []
    oArray = []
    turn = true
    turnLabel.text = "X's turn"
    wonLabel.isHidden = true
    wonLabel.text = ""
    updateButtons()
  }
  
  func updateButtons() {
    buttonArray.forEach {$0.setImage(nil, for: .normal)}
    enableOrDisableButtons(state: true)
  }
  
  func enableOrDisableButtons(state: Bool) {
    buttonArray.forEach {$0.isEnabled = state}
  }
  
  func showWinLabel() {
    wonLabel.isHidden = false
    wonLabel.layer.borderWidth = 2
    wonLabel.layer.cornerRadius = wonLabel.frame.height / 2
    wonLabel.layer.borderColor = UIColor.systemPink.cgColor
    
  }
  
  func tie() {
    if count == 9 {
//      showWinLabel()
      wonLabel.text = "Tie!"
      turnLabel.text = ""
    }
  }
  
  func updateWinningButton(buttons: [Int]) {
    for num in buttons {
      buttonArray[num - 1].tintColor = .red
    }
  }
}

