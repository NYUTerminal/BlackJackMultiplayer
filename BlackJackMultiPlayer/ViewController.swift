//
//  ViewController.swift
//  BlackJackMultiPlayer
//
//  Created by praveen on 2/21/15.
//  Copyright (c) 2015 NYU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var noOfDecks: UITextField!
    
    @IBOutlet weak var bet1: UITextField!
    
    @IBOutlet weak var bet2: UITextField!
    
    @IBOutlet weak var player1Cards: UILabel!
    
    @IBOutlet weak var player2Cards: UILabel!
    
    @IBOutlet weak var dealerCards: UILabel!
    
    @IBOutlet weak var player1Total: UILabel!
    
    @IBOutlet weak var player2Total: UILabel!
    
    @IBOutlet weak var gameState: UILabel!
    
    let maxPlayerCash = 100
    
    var bet = 0
    
    var balance = 100
    
    var playerCardsTotalSum = 0
    
    var dealterCardTotalSum = 0
    
    var shuffledDeck = Array<String>()
    
    var standFlag  = false
    
    var isPlayerWon = false
    
    var numberOfGamesPlayed = 0
    
    var dealerCardsSum = 0
    
    let noOfPlayersInGame = 2
    
    var PlayerHands = Array<PlayerHand>()
    let playerHand = PlayerHand()
    let playerHand1 = PlayerHand()
    let deck = Deck()
    let dealer  = Dealer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "ironman_crop.png")!)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deal(sender: UIButton) {
        
        //var cards : String = "0";
        
        //var shuffledDeck : [Int] = deck.buildDeck(noOfDecks.text.toInt());
        if bet1.text == nil ||  bet1.text == "" {
            gameState.text = "Bet is empty . Please input bet !!"
            println("Bet is empty . Please input some bet to proceed ")
            return
        }
        
        //TODO change logic to stop from playing
        
        if isGreater( bet1.text.toInt()! ) == false || isGreater( bet2.text.toInt()! ) == false
        {
            gameState.text = "Balance is low . You cant play"
            return
        }
        
        /*
        After Every 5 times need to shuffle the deck .
        Number of times played should be multiple of 5.
        */
        
        
       
        PlayerHands.append(playerHand)
        PlayerHands.append(playerHand1)
      
        
        
        if numberOfGamesPlayed%5 == 0 {
            deck.shuffleTheDeck()
        }
        
        deck.buildDeck(noOfDecks.text)
        //Initializing with for loop . Based on number of players
        playerHand.initializePlayers()
        playerHand1.initializePlayers()
        dealer.initializeDealer()

        for player in PlayerHands {
            
            var isPlayerBusted = playerHand.isBusted()
            var isPlayer1Busted = playerHand1.isBusted()
            var isPlayerBlackJack = playerHand.isBlackJack()
            var isPlayer1BlackJack = playerHand1.isBlackJack()
            
            if(isPlayerBusted){
                playerHand.playerStatus = "busted"
            }else if(isPlayer1Busted){
                playerHand1.playerStatus = "busted"
            }else if(isPlayerBlackJack){
                playerHand.playerStatus = "blackjack"
            }else if(isPlayer1BlackJack){
                playerHand1.playerStatus = "blackjack"
            }

        }
        
       
        
        
       
        
       // dealerCards.append(getCardFromDeckAndRemove())
        //dealerCards.append(getCardFromDeckAndRemove())
        //        playerCards.append(getCardFromDeckAndRemove())
        //        playerCards.append(getCardFromDeckAndRemove())
        //        println("playerCards - \(playerCards)")
        //        println("dealerCards - \(dealerCards)")
        //        displayPlayerCardsOnView()
        //        displayDealerCardsOnViewWithFlip()
        //        displayNoOfTimesPlayed()
        //        displayBalance()
        //        bet = betOnView.text.toInt()!
        //        numberOfGamesPlayed++
        //
//                if isBlackJack(playerCards) == true
//                {
//                    makeBillingChanges(true)
//                    displayBalance()
//                    resetCardsTotalAndBetOnView()
//                    gameState.text = "Player Won !!"
//                    println("Player Won")
//                    return
//                }
        //        if isBusted(playerCards) == true
        //        {
        //            makeBillingChanges(false)
        //            displayBalance()
        //            resetCardsTotalAndBetOnView()
        //            gameState.text = "Player Lost !!"
        //            println("Player lost")
        //            return
        //        }
        //
        
    }
    
    func isGreater(bet: Int) -> Bool {
        if bet > 1 && bet < balance{
            return true
        }
        return false
    }
    
    @IBAction func hit1() {
        
        if(playerHand.playerStatus != "blackjack" && playerHand.playerStatus != "busted" && playerHand.playerStatus != "busted"){
            playerHand.cardsInHand.append(deck.getACardFromDeck())
            validationsAfterHit(playerHand , isDealerHand: false , label: gameState )
        }
        
    }
    

    
    @IBAction func stand1() {
        
        
    }
    
    @IBAction func hit2() {
        if(playerHand1.playerStatus != "blackjack" && playerHand1.playerStatus != "busted" && playerHand1.playerStatus != "stand"){
            playerHand1.cardsInHand.append(deck.getACardFromDeck())
            validationsAfterHit(playerHand1 , isDealerHand: false , label: gameState )
        }
        
    }
    
    
    @IBAction func stand2() {
        
        
    }
    
    func validationsAfterHit(var hand : PlayerHand ,var isDealerHand : Bool , var label : UILabel) {
        if(hand.isBlackJack()){
            label.text = label.text! + "BlackJack! Player Wont the game"
        }else if(hand.isBusted()){
            label.text = label.text! + "Busted! Player Busted"
        }
        
        if isDealerHand {
            if(dealer.isBlackJack()){
                label.text = label.text! + "BlackJack! Dealer Won the game"
            }else if(dealer.isBusted()){
                label.text = label.text! + "Busted! Player Won  the game"
            }
        }
    }
    
}

    