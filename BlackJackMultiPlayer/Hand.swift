//
//  Hand.swift
//  BlackJackMultiPlayer
//
//  Created by praveen on 2/26/15.
//  Copyright (c) 2015 NYU. All rights reserved.
//

import Foundation

class Hand {
    
    var cardsInHand : [Int]
    
    var handStatus : HandStatus
    
    var bet : Int = 0
    
    init(){
        bet = 0
        cardsInHand = []
        handStatus = HandStatus.Statue
    }
    
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
    
    
    func getAllCardsInString(cardsInHand :[Int]) -> String {
        if(cardsInHand.count==0){
            return ""
        }
        var tempString = String(cardsInHand[0])
        if(cardsInHand.count>1){
            for i in 2...cardsInHand.count{
                tempString = tempString + " , " + String(cardsInHand[i-1])
            }
        }
        return tempString
    }
    
}
