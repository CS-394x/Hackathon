//
//  ViewController.swift
//  SteamReader
//
//  Created by Rafael De Los Santos on 4/14/15.
//  Copyright (c) 2015 Rafael De Los Santos. All rights reserved.
//

import UIKit

var USER_KEY:String = ""
var USER_NAME:String = ""
var GAME_ARRAY = [String: Dictionary<String, String>]()
var SELECTED_FILTER: String?

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "s_background.png")!)

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func textEntered(sender: AnyObject) {
        USER_KEY = textField.text
    }
    @IBAction func textEnded(sender: AnyObject) {
        USER_KEY = textField.text
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        //search for player
        USER_KEY = textField.text
    }
}
