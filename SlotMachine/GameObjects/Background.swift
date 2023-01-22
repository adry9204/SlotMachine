import GameplayKit
import SpriteKit

class Background : GameObject{
    
    init() {
        super.init(imageString: "background", initialScale: 2.0)
        Start(xPos: 0, yPos: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //lifecycle functions
    override func Start(xPos: Double, yPos: Double) {
        zPosition = 0
        position.y = 0
        position.x = 0
    }
    
    override func Update(){
    }
    
    override func SelectResult() {
        
    }
    
    override func Reset() {
    }
    

}
