//
//  GameDisplay.swift
//  SteamReader
//
//  Created by Rafael De Los Santos on 4/14/15.
//  Copyright (c) 2015 Rafael De Los Santos. All rights reserved.
//

import Foundation
import SpriteKit

class GameDisplay {
    var allButton:Button
    var mostButton:Button
    var leastButton:Button
    var findButton:Button
    var chooseTitle:SKLabelNode
    var titleNode:SKLabelNode
    
    init(_ scene: GameScene) {
        let nameNode = SKLabelNode(fontNamed: "Visitor TT1 BRK")
        scene.addChild(nameNode)
        nameNode.text = USER_NAME
        nameNode.fontSize = 45
        nameNode.fontColor = SKColor(red: 0.58, green: 0.75, blue: 0.98, alpha: 1)
        nameNode.position = CGPoint(x: WIDTH / 2, y: HEIGHT - 70)
        
        let idNode = SKLabelNode(fontNamed: "Visitor TT1 BRK")
        scene.addChild(idNode)
        idNode.text = USER_KEY
        idNode.fontSize = 24
        idNode.fontColor = SKColor(red: 0.46, green: 0.63, blue: 0.88, alpha: 1)
        idNode.position = CGPoint(x: WIDTH / 2, y: HEIGHT - 100)
        
        let numNode = SKLabelNode(fontNamed: "Visitor TT1 BRK")
        scene.addChild(numNode)
        numNode.text = "You have \(GAME_ARRAY.count) games"
        numNode.fontSize = 20
        numNode.fontColor = SKColor(red: 0.28, green: 0.44, blue: 0.69, alpha: 1)
        numNode.position = CGPoint(x: WIDTH / 2, y: HEIGHT - 130)
        
        let lineNode = SKSpriteNode(color: SKColor(red: 0.28, green: 0.44, blue: 0.69, alpha: 1), size: CGSize(width: WIDTH * 0.7, height: 4))
        scene.addChild(lineNode)
        lineNode.position = CGPoint(x: WIDTH / 2, y: HEIGHT - 140)
        
        let filNode = SKLabelNode(fontNamed: "Visitor TT1 BRK")
        scene.addChild(filNode)
        filNode.text = "Select a filter"
        filNode.fontSize = 20
        filNode.fontColor = SKColor(red: 0.19, green: 0.34, blue: 0.57, alpha: 1)
        filNode.position = CGPoint(x: WIDTH / 2, y: HEIGHT - 180)
        
        chooseTitle = SKLabelNode(fontNamed: "Visitor TT1 BRK")
        scene.addChild(chooseTitle)
        chooseTitle.text = "You Should Play"
        chooseTitle.fontSize = 20
        chooseTitle.fontColor = SKColor(red: 1, green: 1, blue: 1, alpha: 1)
        chooseTitle.position = CGPoint(x: WIDTH / 2, y: 170)
        chooseTitle.hidden = true
        
        titleNode = SKLabelNode(fontNamed: "Visitor TT1 BRK")
        scene.addChild(titleNode)
        titleNode.text = "G A M E  T I T L E"
        titleNode.fontSize = 20
        titleNode.fontColor = SKColor(red: 1, green: 1, blue: 1, alpha: 1)
        titleNode.position = CGPoint(x: WIDTH / 2, y: 130)
        titleNode.hidden = true
        
        allButton = Button(image1: "s_allgamesON", image2: "s_allgamesOFF", x: WIDTH / 2, y: HEIGHT - 230, scene: scene, onTouch: allPressed)
        mostButton = Button(image1: "s_mostgamesON", image2: "s_mostgamesOFF", x: WIDTH / 2, y: HEIGHT - 280, scene: scene, onTouch: mostPressed)
        leastButton = Button(image1: "s_leastgamesON", image2: "s_leastgamesOFF", x: WIDTH / 2, y: HEIGHT - 330, scene: scene, onTouch: leastPressed)
        findButton = Button(image1: "s_findgame", image2: "s_findgame", x: WIDTH / 2, y: 50, scene: scene, onTouch: findPressed)
        
    }
}

func allPressed() {
    uiTop.allButton.switchOn()
    uiTop.mostButton.switchOff()
    uiTop.leastButton.switchOff()
    SELECTED_FILTER = "all"
}

func mostPressed() {
    uiTop.allButton.switchOff()
    uiTop.mostButton.switchOn()
    uiTop.leastButton.switchOff()
    SELECTED_FILTER = "greatest"
}

func leastPressed() {
    uiTop.allButton.switchOff()
    uiTop.mostButton.switchOff()
    uiTop.leastButton.switchOn()
    SELECTED_FILTER = "least"
}

func findPressed() {
    if let s = SELECTED_FILTER {
        var game = ""
        switch s {
        case "all":
            game = getRandom()
            break
        case "greatest":
            game = getGreatest()
            break
        case "least":
            game = getLeast()
            break
        default:
            break
        }
        uiTop.chooseTitle.hidden = false
        uiTop.titleNode.hidden = false
        uiTop.titleNode.text = game
    }
}