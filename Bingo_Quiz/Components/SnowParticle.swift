import SwiftUI
import SpriteKit

struct SnowParticle: View {
  let size: CGSize
  
  private var scene: SKScene {
    let emitterNode = SKEmitterNode(fileNamed: "SnowParticle")!
    let scene = SKScene(size: size)
    scene.backgroundColor = .clear
    scene.anchorPoint = CGPoint(x: 0.5, y: 1.0) //中央にパーティクルを配置
    scene.addChild(emitterNode)
    return scene
  }
  
  var body: some View {
    SpriteView(scene: scene, options: [.allowsTransparency])
  }
}
