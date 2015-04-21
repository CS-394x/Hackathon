//
//  GameViewController.swift
//  SteamReader
//
//  Created by Rafael De Los Santos on 4/14/15.
//  Copyright (c) 2015 Rafael De Los Santos. All rights reserved.
//

import UIKit
import SpriteKit

var screenSize: CGRect = UIScreen.mainScreen().bounds
let HEIGHT:CGFloat = screenSize.height
let WIDTH:CGFloat = screenSize.width


class GameViewController: UIViewController, NSXMLParserDelegate {
    var scene: GameScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //steam
        parseData(self)
        
        // Configure the view.
        let skView = view as! SKView
        skView.multipleTouchEnabled = false
        
        // Create and configure the scene.
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFill
        
        // Present the scene.
        skView.presentScene(scene)
    }
    
    var currentTag: String?
    var currentName: String?
    var tempName = ""
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [NSObject : AnyObject]) {
        currentTag = elementName
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String?) {
        if let c = currentTag {
            var text = string!.stringByReplacingOccurrencesOfString("^\\s*",
                withString: "", options: .RegularExpressionSearch)
            if c == "steamID" {
                USER_NAME += text
            }
            else if c == "name" {
                tempName += text
            }
            else if let cN = currentName {
                if GAME_ARRAY[cN]![c] == nil {
                    GAME_ARRAY[cN]![c] = ""
                }
                GAME_ARRAY[cN]![c]! += text
            }
        }
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "name" {
            GAME_ARRAY[tempName] = [String: String]()
            currentName = tempName
            tempName = ""
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
