//
//  PlayerHand.swift
//  BlackJackMultiPlayer
//
//  Created by praveen on 2/21/15.
//  Copyright (c) 2015 NYU. All rights reserved.
//

import Foundation


class PlayerHand {
    
    var cardsInHand = Array<Int>()
    
    var playerHands  = [Array<Int>()]
    
    var playerCardsTotalSum = 0
    
    //May carry busted , blackjack , stand
    var playerStatus : String = ""
    
    func initializePlayers(){
        let deck = Deck()
         cardsInHand.append(deck.getACardFromDeck())
         cardsInHand.append(deck.getACardFromDeck())
    }
    
    func getPlayerCards(var playerNumber :Int) -> [Int] {
        return playerHands[playerNumber];
    }
    
    func addCardToHand(var card : Int, var playerNo : Int) {
        
        playerHands[playerNo].append(card);
        
    }
    
    
    func getSumOfCards() -> Int{
        var tempCount = 0
        for card in cardsInHand {
            tempCount += card
        }
        return tempCount
    }
    
    func isBlackJack() -> Bool {
       var tempCount = getSumOfCards()
        if  tempCount == 21 {
            return true
        }
        playerCardsTotalSum = tempCount
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
