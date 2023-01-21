import Foundation
import GameplayKit
import SpriteKit

class GameObject : SKSpriteNode, GameProtocol
{
    
    // constructor / initializer
    init(imageString: String, initialScale: CGFloat)
    {
        // initialize the game object with an image
        let texture = SKTexture(imageNamed: imageString)
        let color = UIColor.clear
        super.init(texture: texture, color: color, size: texture.size())
        
       
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Life-Cycle Functions
    
    
    func Start()
    {
        
    }
    
    func Update()
    {
        
    }
    
    
    func CheckBounds()
    {
        
    }
    
    func Reset()
    {
        
    }
    
    
}

