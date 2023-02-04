//
//  HomeViewController.swift
//  SlotMachine
//
//  Created by Adriana Diaz Torres on 2/3/23.
//

import Foundation
import UIKit


class HomeViewController: UIViewController {
    
    var currentText: String = ""
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var amountTextField: UITextField!
    
    override func viewDidLoad() {
        
        let game = Game(availableAmount: 100, currentBet: 10)
        while game.availableAmount != 0 {
            game.spin()
            for reel in 0...2 {
                print(game.currentDraw[reel])
            }
            print(game.availableAmount)
            print("****************")
        }
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //info on the text field
        let amount = amountTextField.text ?? ""
            
        //instance of the GameViewController
        // passing on the data fro the text field
        let destinationVC = segue.destination as! GameViewController
        destinationVC.game.availableAmount = Int(amount)!
    }
    
    @IBAction func onTextChange(_ sender: UITextField) {
       
        let newChar: Character? = amountTextField.text?.last
        if (newChar != nil) {
            if(!newChar!.isNumber){
                var currentText = amountTextField.text!
                currentText.removeLast()
                amountTextField.text = currentText
            }
        }
        
        //chequing if the text of the amount is empty
        //to activate or desactivate the START button
        let amount = amountTextField.text ?? ""
        
        if(amount.count == 0){
            startButton.isEnabled = false
        } else {
            startButton.isEnabled = true
        }
        
    }
    
   
}

