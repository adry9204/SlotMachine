import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var reelLeft : Reel?
    var reelMiddle: Reel?
    var reelRight: Reel?

    
    override func sceneDidLoad() {
        name = "SLOT"
        
        // add ocean1 to the scene and starts it at the Reset location
        reelLeft = Reel(xPos: -180, yPos: 0)
        addChild(reelLeft!)
        
        reelMiddle = Reel(xPos: 0, yPos: 0)
        addChild(reelMiddle!)
        
        reelRight = Reel(xPos: 180, yPos: 0)
        addChild(reelRight!)
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
      
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

