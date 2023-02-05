//Slot Machine Project for iOS Development Class for Group 7
//Adriana Diaz: 301157161 & Aurela Bala: 301279255
//Date: 22/01/2023
//Version: 1.1
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
    @IBOutlet weak var gotItButton: UIButton!
    
    //JackPot items
    @IBOutlet weak var JackPotImage: UIImageView!
    @IBOutlet weak var JackPotAmmount: UILabel!
    
    //main game items
    @IBOutlet weak var TotalAmmount: UILabel!
    @IBOutlet weak var currentBetLabel: UILabel!
    @IBOutlet weak var JackPotLabel: UILabel!
    
    //local variables
    var game: Game = Game(availableAmount: 0, currentBet: 10)
    var initialAmount = 0
    
    //Sprite Kit
    var globalScene = GameScene()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialAmount = game.availableAmount
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
                
                globalScene = sceneNode
            }
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
        
        //check for JackPot
        if(game.wonJackPot){
            JackPotImage.isHidden = false
            JackPotAmmount.text = String(game.jackPot)
            JackPotAmmount.isHidden = false
            gotItButton.isHidden = false
        } else {
            
            TotalAmmount.text = "$ " + String(game.availableAmount)
            
            if(game.currentBet > game.availableAmount){
                game.currentBet = game.availableAmount
                currentBetLabel.text = String(game.currentBet)
            }
            
        }
        //updating the JackPot
        JackPotLabel.text = "$ " + String(game.jackPot)
        
        updateReels()
        //checking if the player ran out of money
        if(game.availableAmount == 0) {
            SpinButton.isEnabled = false
        }
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        //reseting logic
        game.availableAmount = initialAmount
        game.resetLocalVariables()
        game.currentBet = 10
        game.wonJackPot = false
        game.currentDraw = [.Blank, .Blank, .Blank]
        
        //reseting UI
        currentBetLabel.text = "10"
        TotalAmmount.text = "$ " + String(game.availableAmount)
        SpinButton.isEnabled = true
        
    }
    
    @IBAction func gotItButtonPressed(_ sender: UIButton) {
        JackPotImage.isHidden = true
        JackPotAmmount.isHidden = true
        gotItButton.isHidden = true
        
        TotalAmmount.text = "$ " + String(game.availableAmount)
        //GET REELS TO INITIAL STATE
    }
    
    
    func updateReels() {
        let leftSymbol = game.getSymbolName(symbol: game.currentDraw[0])
        let middleSymbol = game.getSymbolName(symbol: game.currentDraw[1])
        let rightSymbol = game.getSymbolName(symbol: game.currentDraw[2])
        
        globalScene.changeImage(symbolName: leftSymbol, pos: 0)
        globalScene.changeImage(symbolName: middleSymbol, pos: 1)
        globalScene.changeImage(symbolName: rightSymbol, pos: 2)
        
    }
}
