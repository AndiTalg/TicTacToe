//
//  ViewController.swift
//  TicTacToe
//
//  Created by Talg on 27.09.15.
//  Copyright © 2015 Talg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  // 1 is equal to noughts, 2 equal to crosses
  
  var activePlayer = 1
  
  var gameActive = true
  
  var gameState = [0,0,0,0,0,0,0,0,0]
  
  var winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  
  @IBOutlet weak var button: UIButton!
  

  @IBAction func buttonPressed(sender: AnyObject) {
    
    if gameState[sender.tag] == 0 && gameActive == true {
      
      var image = UIImage()
      
      gameState[sender.tag] = activePlayer
      
      if activePlayer == 1 {
        image = UIImage(named: "nought")!
        activePlayer = 2
      } else {
        image = UIImage(named: "cross")!
        activePlayer = 1
      }
      
      sender.setImage(image, forState: .Normal)
      
      for combination in winningCombinations {
        if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
          
          if gameState [combination[0]] == 1 {
            print("Nought wins !!!")
          } else {
            print("Cross wins !!!")
          }
          
          gameActive = false
        }
      }
    }
    
  }
  

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

