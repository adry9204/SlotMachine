import GameplayKit
import SpriteKit

class Fireworks : GameObject
{
    init(xPos: Double, yPos: Double)
    {
        super.init(imageString: "fireworks", initialScale: 0.5)
        Start(xPos: xPos, yPos: yPos)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func Start(xPos: Double, yPos: Double)
    {
        zPosition = 4
        position.y = yPos
        position.x = xPos
    }
    
    override func Update()
    {
    }
    
    override func SelectResult()
    {
    }
    
    override func Reset()
    {
        
    }
    
    
    
    
    
}


