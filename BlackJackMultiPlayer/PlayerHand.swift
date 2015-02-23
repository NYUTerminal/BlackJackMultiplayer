//
//  PlayerHand.swift
//  BlackJackMultiPlayer
//
//  Created by praveen on 2/21/15.
//  Copyright (c) 2015 NYU. All rights reserved.
//

import Foundation


class PlayerHand {
    
    var playerHands  = [Array<Int>()]
    
    func initializePlayers(){
        for i in 1...2{
            playerHands.append([])
        }
    }
    
    func getPlayerCards(var playerNumber :Int) -> [Int] {
        return playerHands[playerNumber];
    }
    
    func addCardToHand(var card : Int, var playerNo : Int) {
        
        playerHands[playerNo].append(card);
        
    }
    
    
    func getSumOfCards(cardsInHand : Array<Int>) -> Int{
        var tempCount = 0
        for card in cardsInHand {
            tempCount += card
        }
        return tempCount
    }
    
}
