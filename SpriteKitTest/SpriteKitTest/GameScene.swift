//
//  GameScene.swift
//  SpriteKitTest
//
//  Created by Lisa J on 3/14/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var penguin = SKSpriteNode()
    private var penguinWalkingFrames: [SKTexture] = []
    
    override func didMove(to view: SKView) {
        backgroundColor = .blue
        buildPenguin()
    }
    
    func buildPenguin() {
        let penguinAnimatedAtlas = SKTextureAtlas(named: "penguin")
        var walkFrames: [SKTexture] = []
        
        let numImages = penguinAnimatedAtlas.textureNames.count
        for i in 1...numImages {
            let penguinTextureName = "Penguin\(i)"
            walkFrames.append(penguinAnimatedAtlas.textureNamed(penguinTextureName))
        }
        penguinWalkingFrames = walkFrames
        let firstFrameTexture = penguinWalkingFrames[0]
        penguin = SKSpriteNode(texture: firstFrameTexture)
        penguin.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(penguin)
    }
    
}
