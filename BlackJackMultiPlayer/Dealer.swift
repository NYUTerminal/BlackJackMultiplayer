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
    
    func getSumOfCards() -> Int{
        var tempCount = 0
        for card in dealerHand {
            tempCount += card
        }
        return tempCount
    }
    

}