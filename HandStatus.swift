//
//  PlayerStatus.swift
//  BlackJackMultiPlayer
//
//  Created by praveen on 2/26/15.
//  Copyright (c) 2015 NYU. All rights reserved.
//

enum HandStatus: String {
    //May carry busted , blackjack , stand , won , lost
    case Busted = "busted"
    case BlackJack = "blackjack"
    case Stand = "stand"
    case Won = "won"
    case Lost = "Lost"
    case Turn = "turn"
    case Statue = "statue"
    
    //case
    
    
    
//    case Ace = 1
//    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
//    case Jack, Queen, King
//    func simpleDescription() -> String {
//        switch self {
    //        case .Ace:
//            return "ace"
//        case .Jack:
//            return "jack"
//        case .Queen:
//            return "queen"
//        case .King:
//            return "king"
//        default:
//            return String(self.toRaw())
//        }
//    }
}

