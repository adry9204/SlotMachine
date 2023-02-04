//Slot Machine Project for iOS Development Class for Group 7
//Adriana Diaz: 301157161 & Aurela Bala: 301279255
//Date: 22/01/2023
//Version: 1.0
//Implementation of the User Interface for a Slot Machine app. It includes the scenario of the user winning the JackPot
//It uses SpriteKit to be able to add animation to a couple of components such as the reels and the fireworks


import UIKit
import SpriteKit
import GameplayKit
import Foundation
import UIKit


class GameViewController: UIViewController {

    //action items
    @IBOutlet weak var SpinButton: UIButton!
    
    //JackPot items
    @IBOutlet weak var JackPotImage: UIImageView!
    @IBOutlet weak var JackPotAmmount: UILabel!
    
    //main game items
    @IBOutlet weak var TotalAmmount: UILabel!
    @IBOutlet weak var currentBetLabel: UILabel!
    
    
    var game: Game = Game(availableAmount: 0, currentBet: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Initializing UI
        TotalAmmount.text = "$ " + String(game.availableAmount)
        
        
        TotalAmmount.layer.cornerRadius = 12
        TotalAmmount.layer.borderWidth = 1
        TotalAmmount.layer.borderColor = CGColor(srgbRed: 255, green: 180, blue: 0, alpha: 1)
        
        JackPotImage.layer.zPosition = 3
        JackPotAmmount.layer.zPosition = 4
        
        if let scene = GKScene(fileNamed: "GameScene") {
            
            if let sceneNode = scene.rootNode as! GameScene? {
                
                sceneNode.scaleMode = .aspectFill
                
                if let view = self.view as! SKView? {
                    view.presentScene(sceneNode)
                    view.ignoresSiblingOrder = true
                    
                }
            }
        }
    }

    @IBAction func ShowHideJackPot(_ sender: Any) {
        if JackPotImage.isHidden {
            JackPotImage.isHidden = false
            JackPotAmmount.isHidden = false
        } else {
            JackPotImage.isHidden = true
            JackPotAmmount.isHidden = true
        }
        
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
 
    @IBAction func plusButtonPressed(_ sender: UIButton) {
        //checking if the bet is valid
        if(game.currentBet + 5 <= game.availableAmount){
            game.currentBet += 5
            currentBetLabel.text = String(game.currentBet)
        }
    }
    
    @IBAction func minusButtonPressed(_ sender: UIButton) {
        //checking if the bet is valid
        if(game.currentBet - 5 > 0){
            game.currentBet -= 5
            currentBetLabel.text = String(game.currentBet)
        }
    }
    
    @IBAction func spinButtonPressed(_ sender: UIButton) {
        game.spin()
        TotalAmmount.text = "$ " + String(game.availableAmount)
        
        if(game.currentBet > game.availableAmount){
            game.currentBet = game.availableAmount
            currentBetLabel.text = String(game.currentBet)
        }
        
        print(game.currentDraw[0])
        print(game.currentDraw[1])
        print(game.currentDraw[2])
        print(game.availableAmount)
        print("  ****************")
        
    }
}
