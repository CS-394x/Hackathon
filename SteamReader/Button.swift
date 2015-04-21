//
//  Button.swift
//  SteamReader
//
//  Created by Rafael De Los Santos on 4/20/15.
//  Copyright (c) 2015 Rafael De Los Santos. All rights reserved.
//

import Foundation
import SpriteKit

class Button{
    var on:ButtonSprite
    var off:ButtonSprite
    init(image1:String, image2:String, x:CGFloat, y:CGFloat, scene:SKScene, onTouch:()->()) {
        on = ButtonSprite(imageName: image1, onTouch:onTouch)
        off = ButtonSprite(imageName: image2, onTouch:onTouch)
        on.position = CGPoint(x: x, y: y)
        off.position = CGPoint(x: x, y: y)
        scene.addChild(on)
        scene.addChild(off)
        on.hidden = true
    }
    
    func switchOn () {
        on.hidden = false
        off.hidden = true
    }
    
    func switchOff () {
        on.hidden = true
        off.hidden = false
    }
}

class ButtonSprite:SKSpriteNode {
    var f:()->()
    init (imageName:String, onTouch:()->()) {
        var t = SKTexture(imageNamed: imageName)
        f = onTouch
        super.init(texture:t, color:SKColor.whiteColor(), size: t.size())
        userInteractionEnabled = true
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        f()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
