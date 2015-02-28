//
//  HomeViewController.swift
//  BlackJackMultiPlayer
//
//  Created by praveen on 2/24/15.
//  Copyright (c) 2015 NYU. All rights reserved.
//
import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var noOfPlayers: UITextField!
    
    
    @IBOutlet weak var startingBalance: UITextField!
    
    
    @IBOutlet weak var noOfDecks: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "ironman_crop.png")!)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func start() {
        //Initialize and save to singelton class
        if(noOfDecks.text=="" || noOfPlayers.text == "" || startingBalance == ""){
            return
        }
        var gameProperties = GameProperties.sharedInstance
        gameProperties.noOfPlayers = noOfPlayers.text.toInt()!
        gameProperties.startingBalance = NSString(string: startingBalance.text).doubleValue
        gameProperties.noOfDecks = noOfDecks.text.toInt()!
        
    }
    

    
}
