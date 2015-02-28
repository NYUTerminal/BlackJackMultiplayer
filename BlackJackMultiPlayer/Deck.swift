//
//  Deck.swift
//  BlackJackMultiPlayer
//
//  Created by praveen on 2/21/15.
//  Copyright (c) 2015 NYU. All rights reserved.
//

import Foundation

//Referenced from google . How to shuffle an array by extending the inbuilt Array .
extension Array {
    func shuffled() -> [T] {
        var list = self
        for i in 0..<(list.count - 1) {
            let j = Int(arc4random_uniform(UInt32(list.count - i))) + i
            swap(&list[i], &list[j])
        }
        return list
    }
}

class Deck {
    //Function to initialize the deck
    
    //var imageView:UIImageView = UIImageView()
    var backgroundDict:Dictionary<String, String> = Dictionary()
    
    var shuffledDeck = Array<Int>()
    
    func buildDeck(var noOfCardsInDeck : Int) -> [Int]  {
        //Validation for number of cards
        var Suit = ["Spades","Hearts","Diamonds" , "Clubs"]
        //var Card = ["1","2","3","4","5","6","7","8","9","10","10","10","10"]
        var Card = [1,2,3,4,5,6,7,8,9,10,10,10,10]

        var deck = Array<Int>()
        for i in 1...noOfCardsInDeck
        {
            for suit in Suit
            {
                for card in Card {
                    deck.append(card)
                }
            }
        }
        shuffledDeck = deck.shuffled()
        return shuffledDeck
    }
    
    func getACardFromDeck() -> Int {
       return shuffledDeck.removeAtIndex(0)
    }
    
    func shuffleTheDeck(){
        shuffledDeck = shuffledDeck.shuffled()
    }
    
    
    
    
}
