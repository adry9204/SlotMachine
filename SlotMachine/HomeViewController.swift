//
//  HomeViewController.swift
//  SlotMachine
//
//  Created by Adriana Diaz: 301157161 & Aurela Bala: 301279255 on 08/02/2023.
//  Version 1.3.0
//  This controller is responsible for all the logic and validation required at the start of a new game
//  It makes sure that the input in the Text Field can be parse to Int, preventing the user to the wrong type of data
//  It ensures the amout of money the player will start with is larger than $10. Once completed this process it will proceed through a segue
//  to the Game Scene

import Foundation
import UIKit


class HomeViewController: UIViewController {
    
    var currentText: String = ""
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var amountTextField: UITextField!
    
    override func viewDidLoad() {
        
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
        
        if(amount.count != 0 && Int(amount)! >= 10){
            startButton.isEnabled = true
        } else {
            startButton.isEnabled = false
        }
        
    }
    
   
}

