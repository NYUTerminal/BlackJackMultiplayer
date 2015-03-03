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
            //Logic to get Ace as 1 or 11 is implemented below .
            var tempCount : Int = 0
            var acePresent:Bool = false
            for card in cardsInHand {
                if(card == 1){
                    acePresent = true
                }
                tempCount += card
            }
            if(acePresent){
                if(tempCount<21){
                    if(tempCount+10<21){
                        tempCount = tempCount+10
                    }
                }
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
        var tempString = ""
        if(cardsInHand[0]==1){
            var tempString = String(cardsInHand[0])+"(11-Ace)"
        }else{
            tempString = String(cardsInHand[0])
        }
        
        if(cardsInHand.count>1){
            for i in 2...cardsInHand.count{
                if(cardsInHand[i-1]==1){
                    tempString = tempString + " , " + String(cardsInHand[i-1])+"(11-Ace)"
                }else{
                    tempString = tempString + " , " + String(cardsInHand[i-1])
                }
            }
        }
        return tempString
    }
    
}
