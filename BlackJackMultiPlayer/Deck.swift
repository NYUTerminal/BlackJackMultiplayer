//
//  Deck.swift
//  BlackJackMultiPlayer
//
//  Created by praveen on 2/21/15.
//  Copyright (c) 2015 NYU. All rights reserved.
//

import Foundation

class Deck {
    //Function to initialize the deck
    var shuffledDeck = Array<Int>()
    
    var deck = Array<Int>()
    
    var gameProperties = GameProperties.sharedInstance
    
    func buildDeck(var noOfDecks : Int) -> [Int]  {
        //Validation for number of cards
        var Suit = ["Spades","Hearts","Diamonds" , "Clubs"]
        //var Card = ["1","2","3","4","5","6","7","8","9","10","10","10","10"]
        var Card = [1,2,3,4,5,6,7,8,9,10,10,10,10]
        
        for i in 1...noOfDecks
        {
            for suit in Suit
            {
                for card in Card {
                    deck.append(card)
                }
            }
        }
        shuffle()
        shuffledDeck = deck
        GameProperties.sharedInstance.deck = shuffledDeck
        return shuffledDeck
    }
    
    func shuffle() {
        var temp: Int
        for i in 0...(deck.count-1) {
            let j = Int(arc4random_uniform(UnicodeScalarValue(deck.count)))
            println(j)
            temp = deck[i]
            println(i,j)
            deck[i]=deck[j]
            deck[j]=temp
            
        }
    }
    
    func shuffle<T>(var list: Array<T>) -> Array<T> {
        for i in 0..<list.count {
            let j = Int(arc4random_uniform(UInt32(list.count - i))) + i
            list.insert(list.removeAtIndex(j), atIndex: i)
        }
        return list
    }
    
    func getACardFromDeck() -> Int {
        return GameProperties.sharedInstance.deck.removeAtIndex(0)
    }
    
}
