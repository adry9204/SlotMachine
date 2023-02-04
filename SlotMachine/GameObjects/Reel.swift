import GameplayKit
import SpriteKit

class Reel : GameObject
{
    init(xPos: Double, yPos: Double, symbol: String)
    {
        super.init(imageString: symbol, initialScale: 1.0)
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
    
    override func SelectResult()
    {
        let picture = arc4random_uniform(3)
        print(picture)
    }
    
    override func Reset()
    {
        
    }
    
    
    
    
    
    
    
}

