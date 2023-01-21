import GameplayKit
import SpriteKit

class Reel : GameObject
{
    init(xPos: Double, yPos: Double)
    {
        super.init(imageString: "cherry", initialScale: 0.5)
        Start(xPos: xPos, yPos: yPos)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func Start(xPos: Double, yPos: Double)
    {
        zPosition = 2
        position.y = yPos
        position.x = xPos
    }
    
    override func Update()
    {
    }
    
    override func CheckBounds()
    {
    }
    
    override func Reset()
    {
        
    }
    
    
    
    
    
}

