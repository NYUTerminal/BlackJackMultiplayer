//
//  GameProperties.swift
//  BlackJackMultiPlayer
//
//  Created by praveen on 2/26/15.
//  Copyright (c) 2015 NYU. All rights reserved.
//


//Singelton Class to store all global values
class GameProperties {
    
    var noOfPlayers:Int = 5
    
    class var sharedInstance: GameProperties {
        
        struct Static {
            static let instance: GameProperties = GameProperties()
        }
        return Static.instance
    }
    
}