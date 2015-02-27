//
//  PlayerHand.swift
//  BlackJackMultiPlayer
//
//  Created by praveen on 2/21/15.
//  Copyright (c) 2015 NYU. All rights reserved.
//

import Foundation


class Player {
    
    var hand = Hand()
    
    var hand1 = Hand()
    
    var playerCardsTotalSum = 0
    
    var balance : Double = 100;
        
    func initializeHand(){
        let deck = Deck()
         hand.cardsInHand.append(deck.getACardFromDeck())
         hand.cardsInHand.append(deck.getACardFromDeck())
    }
    
    
    //Not needed
    func addCardToHand(var card : Int, var handNo : Int) {
       hand.cardsInHand.append(card);
    }
    
    
//    func getSumOfCards() -> Int{
//        var tempCount = 0
//        for card in hand.cardsInHand {
//            tempCount += card
//        }
//        return tempCount
//    }
    

    
}
