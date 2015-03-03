//
//  PlayerHand.swift
//  BlackJackMultiPlayer
//
//  Created by praveen on 2/21/15.
//  Copyright (c) 2015 NYU. All rights reserved.
//

import Foundation


class Player {
    
    var hand:Hand
    
    var playerCardsTotalSum:Int
    
    var balance : Int;
    
    init() {
        hand = Hand()
        playerCardsTotalSum = 0
        balance = 100
    }
    
    func initializeHand(){
        let deck = Deck()
        hand.cardsInHand.append(deck.getACardFromDeck())
        hand.cardsInHand.append(deck.getACardFromDeck())
    }
    
}
