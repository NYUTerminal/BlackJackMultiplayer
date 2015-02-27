//
//  Hand.swift
//  BlackJackMultiPlayer
//
//  Created by praveen on 2/26/15.
//  Copyright (c) 2015 NYU. All rights reserved.
//

import Foundation

class Hand {
    
    var cardsInHand : [Int] = []
    
    var handStatus : HandStatus = HandStatus.Turn
    
    var bet : Double = 0
    
    var handSum : Int {
        get{
            var tempCount : Int = 0
            for card in cardsInHand {
                tempCount += card
            }
            //handSum = tempCount
            return tempCount
        }set{
            self.handSum = newValue
        }
    }
    
    func isBlackJack() -> Bool {
        var tempCount = handSum
        if  tempCount == 21 {
            return true
        }
        return false
    }
    
    func isBusted() -> Bool {
        var tempCount = handSum
        
        if tempCount > 21 {
            return true
        }
        return false
        
    }
    
    
    func getAllCardsInString() -> String {
        var tempString = ""
        for i in 1...cardsInHand.count{
            tempString = tempString + " , " + String(cardsInHand[i])
        }
        return tempString
    }
    
}
