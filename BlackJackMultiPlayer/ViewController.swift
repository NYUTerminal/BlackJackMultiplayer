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
    
    var noOfPlayersInGame :Int = 2
    
    var playerList : [Player] = []
    
    let deck = Deck()
    
    var dealer  = Dealer()
    
    var numberOfDecks:Int = 2;
    
    var maxBalanceForPlayer:Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //noOfPlayersInGame = GameProperties.sharedInstance.noOfPlayers
        //maxBalanceForPlayer = GameProperties.sharedInstance.startingBalance
        //numberOfDecks = GameProperties.sharedInstance.noOfDecks
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "")!)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func hit(sender: SpringButton) {
        for i in 1...noOfPlayersInGame{
            var hand = playerList[i-1].hand
            if(hand.handStatus == HandStatus.Turn){
                hand.cardsInHand.append(deck.getACardFromDeck())
                if(hand.handSum == 21){
                    playerList[i-1].hand.handStatus = HandStatus.BlackJack
                    showViewItems()
                    if(i != noOfPlayersInGame){
                        playerList[i].hand.handStatus = HandStatus.Turn
                    }
                    return
                }else if(hand.handSum>21){
                    playerList[i-1].hand.handStatus = HandStatus.Busted
                    showViewItems()
                    if(i != noOfPlayersInGame){
                        playerList[i].hand.handStatus = HandStatus.Turn
                    }else if (i == noOfPlayersInGame){
                        dealerTurn()
                    }
                    return
                }
                showViewItems()
            }
        }
        
    }
    
    
    @IBAction func stand(sender: SpringButton) {
        var allPlayersAreDonePlaying = true
        for i in 1...noOfPlayersInGame{
            var hand = playerList[i-1].hand
            if(hand.handStatus == HandStatus.Turn){
                hand.handStatus = HandStatus.Stand
                if(i != noOfPlayersInGame){
                 playerList[i].hand.handStatus = HandStatus.Turn
                }
                break
            }
        }
        for i in 1...noOfPlayersInGame{
            var hand = playerList[i-1].hand
            if(hand.handStatus == HandStatus.Turn){
                allPlayersAreDonePlaying = false
            }
        }
        if(allPlayersAreDonePlaying){
            dealerTurn()
        }
        
    }
    
    
    @IBAction func deal(sender: UIButton) {
        clearAllItemsOnScreen()
        //var cards : String = "0";
        
        //var shuffledDeck : [Int] = deck.buildDeck(noOfDecks.text.toInt());
        //TODO Need to add proper validation
        //        for i:Int in 1...noOfPlayersInGame {
        //            if(playerList[i-1].hand.bet<0 && playerList[i-1].hand.bet>100){
        //                gameState.text = "Bet is empty . Please input bet !!"
        //                println("Bet is empty . Please input some bet to proceed ")
        //                return
        //            }
        //
        //        }
        
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
            //  deck.shuffleTheDeck()
        }
        
        
        //Initializing with for loop . Based on number of players
        deck.buildDeck(numberOfDecks)
        dealer.initializeDealer()
        for i in 1...noOfPlayersInGame {
            initialize()
            var playerHand = playerList[i-1].hand
            validations(playerList[i-1])
        }
        showViewItems()
        
    }
    
    func initialize(){
        for i in 1...noOfPlayersInGame {
            var player = Player()
            player.initializeHand()
            player.hand.bet = getBet(i-1)
            if(i==1){
                player.hand.handStatus = HandStatus.Turn
            }else{
                player.hand.handStatus = HandStatus.Statue
            }
            playerList.append(player)
        }
    }
    
    func getBet(index : Int) -> Int {
        switch index{
        case 1:
            return player1Bet.text.toInt()!
        case 2:
            return player2Bet.text.toInt()!
        case 3:
            return player3Bet.text.toInt()!
        case 4:
            return player4Bet.text.toInt()!
        case 5:
            return player5Bet.text.toInt()!
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
    
    func showViewItems(){
        var index:Int = 1;
        var i:Int = 0
        balance.text = ""
        gameState.text = ""
        for i = noOfPlayersInGame; i > 0; i-- {
            var hand = playerList[i-1].hand
            var currentLabel = getLabelsOnIndex(i)
            currentLabel.text = hand.getAllCardsInString(hand.cardsInHand)
            balance.text = balance.text! + String(index) + ": " + String(playerList[i-1].balance) + " , "
            //Refactor it to not statue .. bad coding .
            if(hand.handStatus == HandStatus.BlackJack || hand.handStatus == HandStatus.Busted || hand.handStatus == HandStatus.Turn || hand.handStatus == HandStatus.Stand){
                gameState.text = gameState.text! + String(i) + ": "+hand.handStatus.rawValue+","
            }
            index = index+1
        }
        showDealerCards(false)
    }
    
    func showDealerCards(var showFullCards : Bool){
        var dealerHand = dealer.dealerHand

        if(!showFullCards){
            dealerCards.text = "FLIP"
        }else{
            dealerCards.text = String(dealerHand[0])
        }
        for var i = dealerHand.count ; i>0 ; i-- {
            dealerCards.text = dealerCards.text! + " , " + String(dealerHand[i-1])
        }
        
    }
    
    func clearAllItemsOnScreen() {
        for i in 1...5{
            playerList = []
            getLabelsOnIndex(i).text = ""
            dealerCards.text = ""
            dealer = Dealer()
//            player1Bet.text = ""
//            player2Bet.text = ""
//            player3Bet.text = ""
//            player4Bet.text = ""
//            player5Bet.text = ""
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
            }else if dealerSum < playerHand.hand.handSum && playerHand.hand.handStatus == HandStatus.Stand {
                playerHand.hand.handStatus =  HandStatus.Won
                doBalanceChanges(playerHand,isPlayerWon : true)
            }else{
                playerHand.hand.handStatus =  HandStatus.Statue
                //No balance change incase of draw
            }
            
        }
        showDealerCards(true)
        showViewItems()
    }
    
    func doBalanceChanges(var player : Player , var isPlayerWon : Bool) {
        if(isPlayerWon){
            player.balance += player.hand.bet
        }else{
            player.balance -= player.hand.bet
        }
    }
    
}

    