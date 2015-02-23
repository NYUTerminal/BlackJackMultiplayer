//
//  Dealer.swift
//  BlackJackMultiPlayer
//
//  Created by praveen on 2/22/15.
//  Copyright (c) 2015 NYU. All rights reserved.
//

import Foundation


class Dealer {
    
    var dealerHand  = Array<Int>()
    
    var dealerBalance : Double = 100;
    
    let deck = Deck()
    
    var dealerCardsSum = 0
    
    func initializeDealer(){
        dealerHand.append(deck.getACardFromDeck())
        dealerHand.append(deck.getACardFromDeck())
    }
    
    func getSumOfCards() -> Int{
        var tempCount = 0
        for card in dealerHand {
            tempCount += card
        }
        return tempCount
    }
    
    func isBlackJack() -> Bool {
        var tempCount = getSumOfCards()
        if  tempCount == 21 {
            return true
        }
        dealerCardsSum = tempCount
        return false
    }
    
    func isBusted() -> Bool {
        var tempCount = getSumOfCards()
        
        if tempCount > 21 {
            return true
        }
        return false
        
    }

}