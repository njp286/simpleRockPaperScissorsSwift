//
//  RoShamBoViewController.swift
//  RoShamBo
//
//  Created by Nathaniel PiSierra on 2/9/16.
//  Copyright © 2016 Nathaniel PiSierra. All rights reserved.
//

import UIKit

class RoShamBoViewController: UIViewController {
    
    var userWeapon: Int!
    var computerWeapon : Int!
    var outcomeScore: Int!
    var score: Int!
    var games: Int!
    @IBOutlet var scoreOutlet: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        
        if(games == nil){
            score = 0
            games = 0
        }
        scoreOutlet.text = String(score)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func paperChosen(sender: UIButton) {
        userWeapon = 1
        chooseWeaponComputer()
        outcomeOfGame()
        performSegueWithIdentifier("whoWon", sender: nil)
    }

    @IBAction func scissorsChosen(sender: UIButton) {
        userWeapon = 2
        chooseWeaponComputer()
        outcomeOfGame()
        performSegueWithIdentifier("whoWon", sender: nil)

    }
    
    @IBAction func rockChosen(sender: UIButton) {
        userWeapon = 3
        chooseWeaponComputer()
        outcomeOfGame()
        performSegueWithIdentifier("whoWon", sender: nil)

        
    }
    
    func chooseWeaponComputer(){
        let weapon = Int(arc4random_uniform(UInt32(3)) + 1)
        computerWeapon = weapon
    }
    
    func outcomeOfGame(){
        if (userWeapon == computerWeapon){
            outcomeScore = 0
        }
        else if(userWeapon == 1){
            if(computerWeapon == 2){
                outcomeScore = -1
                score = score - 1
            }
            else{
                outcomeScore = 2
                score = score + 1
            }
        }
        else if (userWeapon == 2){
            if(computerWeapon == 1){
                outcomeScore = 1
                score = score + 1
            }
            else{
                outcomeScore = -3
                score = score - 1
            }
        }
        else{
            if (computerWeapon == 1){
                outcomeScore = -2
                score = score - 1
            }
            else {
                outcomeScore = 3
                score = score + 1
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "whoWon" {
            let controller = segue.destinationViewController as!
            WhoWonViewController
            controller.computerChoice = self.computerWeapon
            controller.userChoice = self.userWeapon
            controller.outcome = self.outcomeScore
            games = games + 1

            
            
        }
        
    }
}
