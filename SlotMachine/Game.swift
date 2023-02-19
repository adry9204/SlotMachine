//
//  Game.swift
//  SlotMachine
//
//  Created by Adriana Diaz Torres on 2/3/23.
//

import Foundation

class Game {
    var availableAmount: Int
    var currentBet: Int
    var currentDraw : [ReelSymbol]
    
    var jackPot: Int
    var wonJackPot: Bool
    
    
    //internal variables
    private var blanks: Int
    private var grapes: Int
    private var bananas: Int
    private var oranges: Int
    private var cherries: Int
    private var strawberry: Int
    private var bells: Int
    private var seven: Int
    
    init(availableAmount: Int, currentBet: Int) {
        self.availableAmount = availableAmount
        self.currentBet = currentBet
        jackPot = 1000
        currentDraw = [.Blank, .Blank, .Blank]
        wonJackPot = false
        
        //initializing local variables
        blanks = 0
        grapes = 0
        bananas = 0
        oranges = 0
        cherries = 0
        strawberry = 0
        bells = 0
        seven = 0

    }
    
    
    func spin(){
        resetLocalVariables()
        
        //updateing the current values
        availableAmount -= currentBet
        checkForJackPot()
        
        if (!wonJackPot) {
            
            for reel in 0...2 {
                let draw = floor(drand48() * 65 + 1)
                
                switch draw {
                case 1..<28:
                    currentDraw[reel] = .Blank
                    blanks += 1
                case 28..<38:
                    currentDraw[reel] = .Grapes
                    grapes += 1
                case 38..<47:
                    currentDraw[reel] = .Bananas
                    bananas += 1
                case 47..<55:
                    currentDraw[reel] = .Oranges
                    oranges += 1
                case 55..<60:
                    currentDraw[reel] = .Cherries
                    cherries += 1
                case 60..<63:
                    currentDraw[reel] = .Strawberry
                    strawberry += 1
                case 63..<65:
                    currentDraw[reel] = .Bells
                    bells += 1
                default:
                    currentDraw[reel] = .Seven
                    seven += 1
                    
                }
            }
            
            calculateWinnings()
        }
    }
    
    func checkForJackPot(){
        
        //check if two random numbers are the same
        let jackPotTry = floor(drand48() * 51 + 1)
        let jackPotWin = floor(drand48() * 51 + 1)
        
        if(jackPotWin == jackPotTry){
            print("You Won the $ " + String(jackPot) + " JackPot!")
            availableAmount += jackPot
            availableAmount += currentBet
            jackPot = 1000
            resetLocalVariables()
            currentDraw = [.Blank, .Blank, .Blank]
            wonJackPot = true
        }
    }
    
    func calculateWinnings() {
        
        if(blanks == 0){
            if(grapes == 3){
                availableAmount += currentBet * 10
            } else if(bananas == 3){
                availableAmount += currentBet * 20
            } else if(oranges == 3){
                availableAmount += currentBet * 30
            } else if(cherries == 3){
                availableAmount += currentBet * 40
            } else if(strawberry == 3){
                availableAmount += currentBet * 50
            } else if(bells == 3){
                availableAmount += currentBet * 75
            } else if(seven == 3){
                availableAmount += currentBet * 100
            } else if(grapes == 2){
                availableAmount += currentBet * 2
            } else if(bananas == 2){
                availableAmount += currentBet * 2
            } else if(oranges == 2){
                availableAmount += currentBet * 3
            } else if(cherries == 2){
                availableAmount += currentBet * 4
            } else if(strawberry == 2){
                availableAmount += currentBet * 5
            } else if(bells == 2){
                availableAmount += currentBet * 10
            } else if(seven == 2){
                availableAmount += currentBet * 20
            } else if(seven == 1){
                availableAmount += currentBet * 5
            } else {
                availableAmount += currentBet
            }
        } else {
            jackPot += currentBet
        }
        
    }
    
    func resetLocalVariables() {
        blanks = 0
        grapes = 0
        bananas = 0
        oranges = 0
        cherries = 0
        strawberry = 0
        bells = 0
        seven = 0
    }
    
    func getSymbolName(symbol: ReelSymbol) -> String {
        switch symbol {
        case .Blank:
            return "blank"
        case .Grapes:
            return "grapes"
        case .Bananas:
            return "bananas"
        case .Oranges:
            return "orange"
        case .Cherries:
            return "cherry"
        case .Strawberry:
            return "strawberry"
        case .Bells:
            return "bell"
        default:
            return "seven"
        }
    }
  
}

enum ReelSymbol
{
    case Blank;
    case Grapes;
    case Bananas;
    case Oranges;
    case Cherries;
    case Strawberry;
    case Bells;
    case Seven;
}
