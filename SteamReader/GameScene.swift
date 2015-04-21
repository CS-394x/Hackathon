//
//  GameScene.swift
//  SteamReader
//
//  Created by Rafael De Los Santos on 4/14/15.
//  Copyright (c) 2015 Rafael De Los Santos. All rights reserved.
//

import SpriteKit

var uiTop : GameDisplay!

class GameScene: SKScene {
    
    override func didMoveToView(view: SKView) {
        //backgroundColor = SKColor(red: 1, green: 1, blue: 1, alpha: 1) //white background
        var bgImage = SKSpriteNode(imageNamed: "s_background.png")
        bgImage.position = CGPoint(x: WIDTH / 2, y: HEIGHT / 2)
        addChild(bgImage)
        
        
        uiTop = GameDisplay(self)
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
