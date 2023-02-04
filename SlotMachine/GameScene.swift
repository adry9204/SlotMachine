import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var reelLeft : Reel?
    var reelMiddle: Reel?
    var reelRight: Reel?

    var background: Background?
    
    var fireworksTop: Fireworks?
    var fireworksBottom: Fireworks?
    
    
    override func sceneDidLoad() {
        name = "SLOT"
        
        // adding reels to the scene
        reelLeft = Reel(xPos: -200, yPos: -60, symbol: "cherry")
        addChild(reelLeft!)
        
        reelMiddle = Reel(xPos: 0, yPos: -60, symbol: "cherry")
        addChild(reelMiddle!)
        
        reelRight = Reel(xPos: 200, yPos: -60, symbol: "cherry")
        addChild(reelRight!)
        
        //adding the background
        background = Background()
        addChild(background!)
        
        //adding the hidden fireworks
        fireworksTop = Fireworks(xPos: 0, yPos: 400)
        addChild(fireworksTop!)
        fireworksTop?.isHidden = true
        
        fireworksBottom = Fireworks(xPos: 0, yPos: -600)
        addChild(fireworksBottom!)
        fireworksBottom?.isHidden = true
    }
    
    func changeImage(symbolName: String, pos: Int) {
        switch pos {
        case 0:
            //update left reel
            removeChildren(in: [reelLeft!])
            reelLeft = Reel(xPos: -200, yPos: -60, symbol: symbolName)
            addChild(reelLeft!)
        case 1:
            //update center
            removeChildren(in: [reelMiddle!])
            reelMiddle = Reel(xPos: 0, yPos: -60, symbol: symbolName)
            addChild(reelMiddle!)
        default:
            //update right
            removeChildren(in: [reelRight!])
            reelRight = Reel(xPos: 200, yPos: -60, symbol: symbolName)
            addChild(reelRight!)
        }
        
    }
    
    func touchDown(atPoint pos : CGPoint) {
        if fireworksTop!.isHidden {
            fireworksTop?.isHidden = false
            fireworksBottom?.isHidden = false
        } else {
            fireworksTop?.isHidden = true
            fireworksBottom?.isHidden = true
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
       
    }
    
    func touchUp(atPoint pos : CGPoint) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    // triggered every frame - once every 16ms
    override func update(_ currentTime: TimeInterval)
    {
        reelLeft?.Update()
        reelMiddle?.Update()
        reelRight?.Update()
                
    }
}

