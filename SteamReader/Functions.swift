//
//  Functions.swift
//  htmlparsetest
//
//  Created by Jacob Macdonald on 4/20/15.
//  Copyright (c) 2015 Howl Interactive. All rights reserved.
//


import SpriteKit

//Global user/game data
//id: 8041514363
var leastGames = [String]()
var greatestGames = [String]()

//Call on load, pass in GameViewController that implements NSXMLParserDelegate
func parseData(delegate: NSXMLParserDelegate) {
    //Steam data parsing
    var url = NSURL(string: "http://steamcommunity.com/profiles/\(USER_KEY)/games?tab=all&xml=1")
    var xmlParser: NSXMLParser! = NSXMLParser(contentsOfURL: url)
    xmlParser.delegate = delegate
    xmlParser.parse()
    for name in GAME_ARRAY.keys {
        if GAME_ARRAY[name]!["hoursOnRecord"] == nil {
            GAME_ARRAY[name]!["hoursOnRecord"] = "0"
        }
    }
    var edgeGames = findEdgeXPercentPlayed(10)
    leastGames = edgeGames.least
    greatestGames = edgeGames.greatest
}

//Helper functions
func getRandom() -> String {
    return Array(GAME_ARRAY.keys)[Int(arc4random_uniform(UInt32(GAME_ARRAY.count)))]
}

func getLeast() -> String {
    return leastGames[Int(arc4random_uniform(UInt32(leastGames.count)))]
}

func getGreatest() -> String {
    return greatestGames[Int(arc4random_uniform(UInt32(greatestGames.count)))]
}

func findEdgeXPercentPlayed(divider: Int) -> (least: [String], greatest: [String]) {
    var left = [String](), right = [String](), temp = GAME_ARRAY
    while left.count < Int(GAME_ARRAY.count / divider) && right.count < Int(GAME_ARRAY.count / divider) {
        var least: String?, leastHours: Double?
        var greatest: String?, greatestHours: Double?
        for (name, values) in temp {
            var hours = (values["hoursOnRecord"]! as NSString).doubleValue
            if least == nil || hours < leastHours {
                least = name
                leastHours = hours
            }
            if greatest == nil || hours > greatestHours {
                greatest = name
                greatestHours = hours
            }
        }
        if left.count < Int(GAME_ARRAY.count / divider) {
            left.append(least!)
            temp.removeValueForKey(least!)
        }
        if right.count < Int(GAME_ARRAY.count / divider) {
            right.append(greatest!)
            temp.removeValueForKey(greatest!)
        }
    }
    return (left, right)
}

func findGamesPlayedLessThan(hours: Double) -> [String] {
    var gamesPlayedLessThan = [String]()
    for (name, values) in GAME_ARRAY {
        if let v = values["hoursOnRecord"] where (v as NSString).doubleValue <= hours {
            gamesPlayedLessThan.append(name)
        }
    }
    return gamesPlayedLessThan
}

func findGamesPlayedMoreThan(hours: Double) -> [String] {
    var gamesPlayedMoreThan = [String]()
    for (name, values) in GAME_ARRAY {
        if let v = values["hoursOnRecord"] where (v as NSString).doubleValue >= hours {
            gamesPlayedMoreThan.append(name)
        }
    }
    return gamesPlayedMoreThan
}