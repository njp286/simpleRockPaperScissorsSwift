//
//  WhoWonViewController.swift
//  RoShamBo
//
//  Created by Nathaniel PiSierra on 2/9/16.
//  Copyright © 2016 Nathaniel PiSierra. All rights reserved.
//

import UIKit

class WhoWonViewController: UIViewController {

    var outcome: Int!
    var computerChoice: Int!
    var userChoice: Int!
    var winner: Int!
    var photo: String!
    var games: Int!
  
  
    
    @IBOutlet weak var winningImage: UIImageView!
    @IBOutlet weak var computerImage: UIImageView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var computerLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var winningOutcome: UILabel!
    
    func winChoice(number: Int){
        if (number > 0){
            winner = 1
        }
        else if(number < 0){
            winner = -1
        }
        else {
            winner = 0
        }
        
        if(abs(number) == 3){
            photo = "RockCrushesScissors"
        }
        else if(abs(number) == 2){
            photo = "PaperCoversRock"
        }
        else if (abs(number) == 1){
            photo = "ScissorsCutPaper"
        }
        else {
            photo = "itsATie"
        }
    }
    
    func userPhoto(user: Int!) -> String!{
        if(user == 1){
            return "paper"
        }
        else if(user == 2){
            return "scissors"
        }
        else{
            return "rock"
        }
    }
    
        
    override func viewWillAppear(animated: Bool) {
        winChoice(outcome)
        winningImage.image = UIImage(named: photo)
        computerImage.image = UIImage(named: userPhoto(computerChoice))
        userImage.image = UIImage(named: userPhoto(userChoice))
        computerLabel.text = userPhoto(computerChoice)
        userLabel.text = userPhoto(userChoice)
        if (winner == 0){
            winningOutcome.text = "It's a tie!"
        }
        else if (winner == 1){
            winningOutcome.text = "You win!"
        }
        else{
            winningOutcome.text = "You lost."
        }
        
        
    }
    
}
