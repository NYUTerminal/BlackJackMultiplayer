//
//  Dealer.swift
//  BlackJackMultiPlayer
//
//  Created by praveen on 2/22/15.
//  Copyright (c) 2015 NYU. All rights reserved.
//

import Foundation


class Dealer {
    
    var dealerHand:[Int]
    
    var dealerBalance : Double
    
    let deck:Deck
    
    init(){
        dealerHand = []
        deck = Deck()
        dealerBalance = 100
    }
    
    var dealerCardsSum : Int {
        get{
            var tempCount : Int = 0
            for card in dealerHand {
                tempCount += card
            }
            //handSum = tempCount
            return tempCount
        }set{
            self.dealerCardsSum = newValue
        }
    }
    
    func initializeDealer(){
        dealerHand.append(deck.getACardFromDeck())
        dealerHand.append(deck.getACardFromDeck())
    }
    
    func isBlackJack() -> Bool {
        var tempCount = dealerCardsSum
        if  tempCount == 21 {
            return true
        }
        dealerCardsSum = tempCount
        return false
    }
    
    func isBusted() -> Bool {
        var tempCount = dealerCardsSum
        
        if tempCount > 21 {
            return true
        }
        return false
        
    }

}