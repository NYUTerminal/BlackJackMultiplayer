//
//  ViewController.swift
//  BlackJackMultiPlayer
//
//  Created by praveen on 2/21/15.
//  Copyright (c) 2015 NYU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var gameState: UILabel!
    
    @IBOutlet weak var player5Cards: UILabel!
    
    @IBOutlet weak var player4Cards: UILabel!
    
    @IBOutlet weak var player3Cards: UILabel!
    
    @IBOutlet weak var player2cards: UILabel!
    
    @IBOutlet weak var player1Cards: UILabel!
    
    @IBOutlet weak var player1Bet: UITextField!
    
    @IBOutlet weak var player2Bet: UITextField!
    
    @IBOutlet weak var player3Bet: UITextField!
    
    @IBOutlet weak var player4Bet: UITextField!
    
    @IBOutlet weak var player5Bet: UITextField!
    
    @IBOutlet weak var balance: UILabel!
    
    @IBOutlet weak var dealerCards: UILabel!
    
    
    let maxPlayerCash = 100
    
    var numberOfGamesPlayed = 0
    
    let noOfPlayersInGame :Int = 2
    
    var playerList : [Player] = []
    
    let deck = Deck()
    
    var dealer  = Dealer()
    
    var numberOfDecks = "5";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  let subVIew = UIView
        
        
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "ironman_crop.png")!)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initialize(){
        
        for i:Int in 1...noOfPlayersInGame {
            var player = Player()
            player.hand.bet = 0
            player.hand.handStatus = HandStatus.Statue
            playerList.append(player)
        }
        playerList[0].hand.handStatus = HandStatus.Turn
        
    }
    
    func getBet(index : Int) -> Double {
        switch index{
        case 1:
            return NSString(string: player1Bet.text).doubleValue
        case 2:
            return NSString(string: player2Bet.text).doubleValue
        case 3:
            return NSString(string: player3Bet.text).doubleValue
        case 4:
            return NSString(string: player4Bet.text).doubleValue
        case 5:
            return NSString(string: player5Bet.text).doubleValue
        default:
            return 0
        }
    }
    
    
    func getLabelsOnIndex(index : Int) -> UILabel {
        switch index{
        case 1:
            return player1Cards
        case 2:
            return player2cards
        case 3:
            return player3Cards
        case 4:
            return player4Cards
        case 5:
            return player5Cards
        default:
            return player1Cards
        }
    }
    
    
    @IBAction func hit(sender: SpringButton) {
        for i in 1...noOfPlayersInGame{
            var hand = playerList[i].hand
            if(hand.handStatus == HandStatus.Turn){
                hand.cardsInHand.append(deck.getACardFromDeck())
                if(hand.handSum == 21){
                    hand.handStatus = HandStatus.BlackJack
                    showViewItems()
                }else if(hand.handSum<21){
                    hand.handStatus = HandStatus.Busted
                    showViewItems()
                }
            }
        }
        
    }
    
    
    @IBAction func stand(sender: SpringButton) {
        var allPlayersAreDonePlaying = true
        for i in 1...noOfPlayersInGame{
            var hand = playerList[i].hand
            if(hand.handStatus == HandStatus.Turn){
                hand.handStatus = HandStatus.Stand
                break
            }
        }
        for i in 1...noOfPlayersInGame{
            var hand = playerList[i].hand
            if(hand.handStatus == HandStatus.Turn){
                allPlayersAreDonePlaying = false
            }
        }
        if(allPlayersAreDonePlaying){
            dealerTurn()
        }
        
    }
    
    
    @IBAction func deal(sender: UIButton) {
        
        //var cards : String = "0";
        
        //var shuffledDeck : [Int] = deck.buildDeck(noOfDecks.text.toInt());
        //TODO Need to add proper validation
        for i:Int in 1...noOfPlayersInGame {
            if(playerList[i-1].hand.bet<0 && playerList[i-1].hand.bet>100){
                gameState.text = "Bet is empty . Please input bet !!"
                println("Bet is empty . Please input some bet to proceed ")
                return
            }
            
        }
        
        //TODO change logic to stop from playing
        
        //        if isGreater( bet1.text.toInt()! ) == false || isGreater( bet2.text.toInt()! ) == false
        //        {
        //            gameState.text = "Balance is low . You cant play"
        //            return
        //        }
        
        /*
        After Every 5 times need to shuffle the deck .
        Number of times played should be multiple of 5.
        */
        
        
        
        if numberOfGamesPlayed%5 == 0 {
            deck.shuffleTheDeck()
        }
        
        
        //Initializing with for loop . Based on number of players
        
        
        
        
        deck.buildDeck(numberOfDecks)
        dealer.initializeDealer()
        for i in 1...noOfPlayersInGame {
            var playerHand = playerList[i].hand
            var cardsInHandForPlayer = playerHand.cardsInHand
            cardsInHandForPlayer.append(deck.getACardFromDeck())
            cardsInHandForPlayer.append(deck.getACardFromDeck())
            if(playerHand.isBusted()){
                playerHand.handStatus = HandStatus.Busted
            }
            if(playerHand.isBlackJack()){
                playerHand.handStatus = HandStatus.BlackJack
            }
        }
        dealer.dealerHand.append(deck.getACardFromDeck())
        dealer.dealerHand.append(deck.getACardFromDeck())
        for i in 1...noOfPlayersInGame {
            var playerHand = playerList[i].hand
            validations(playerList[i])
        }
        showViewItems()
        
    }
    
    func showViewItems(){
        for i in 1...noOfPlayersInGame{
            var hand = playerList[i].hand
            var currentLabel = getLabelsOnIndex(i)
            currentLabel.text = hand.getAllCardsInString()
            balance.text = "\(i)" + "\(playerList[i].balance)" + " , "
        }
    }
    
    func clearAllItemsOnScreen() {
        for i in 1...5{
            playerList = []
            getLabelsOnIndex(i).text = ""
            balance.text = ""
            dealerCards.text = ""
            dealer = Dealer()
        }
        
    }
    
    
    
    func validations(var player : Player) {
        if(player.hand.isBlackJack()){
            doBalanceChanges(player,isPlayerWon : true)
        }else if(player.hand.isBusted()){
            doBalanceChanges(player,isPlayerWon : false)
        }
    }
    
    
    func dealerTurn() {
        
        while(dealer.dealerCardsSum<16){
            dealer.dealerHand.append(deck.getACardFromDeck())
        }
        println("dealer Card sum after stand \(dealer.dealerCardsSum)")
        println("dealer Cards \(dealer.dealerHand)")
        var dealerSum = dealer.dealerCardsSum
        for playerHand in playerList{
            
            if(dealerSum > 21){
                //Loop through all Players and check each status .
                if(playerHand.hand.handStatus == HandStatus.Stand){
                    playerHand.hand.handStatus = HandStatus.Won
                    doBalanceChanges(playerHand,isPlayerWon : true)
                }
                continue
            }
            
            if(dealerSum > playerHand.hand.handSum && playerHand.hand.handStatus == HandStatus.Stand){
                playerHand.hand.handStatus =  HandStatus.Lost
                doBalanceChanges(playerHand,isPlayerWon : false)
            }else if dealerSum < playerHand.hand.handSum{
                playerHand.hand.handStatus =  HandStatus.Won
                doBalanceChanges(playerHand,isPlayerWon : true)
            }else{
                playerHand.hand.handStatus =  HandStatus.Statue
                //No balance change incase of draw
            }
            
        }
        
    }
    
    func doBalanceChanges(var player : Player , var isPlayerWon : Bool) {
        if(isPlayerWon){
            player.balance += player.hand.bet
        }else{
            player.balance -= player.hand.bet
        }
    }
    
    
    
}

    