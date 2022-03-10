//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   //use control + click on a UI element to create IB outlet, this class allows us to code
    @IBOutlet weak var diceImageView1: UIImageView!
    
    @IBOutlet weak var diceImageView2: UIImageView!
    var leftDiceNumber = 1
    var rightDiceNumber = 5
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Who.What(value)
     
        
    }
    //IB Action creates action for this element

    @IBAction func Roll(_ sender: UIButton) {
        diceImageView1.image = [ #imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo") , #imageLiteral(resourceName: "DiceThree") , #imageLiteral(resourceName: "DiceFour") ,#imageLiteral(resourceName: "DiceFive") ,#imageLiteral(resourceName: "DiceSix") ][Int.random(in:0...5)]
        diceImageView2.image = [ #imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo") , #imageLiteral(resourceName: "DiceThree") , #imageLiteral(resourceName: "DiceFour") ,#imageLiteral(resourceName: "DiceFive") ,#imageLiteral(resourceName: "DiceSix") ][Int.random(in:0...5)]
        /*
        leftDiceNumber += 1
        rightDiceNumber-=1
        if (leftDiceNumber >= 6) {
            leftDiceNumber = 1
        }
        
        if (rightDiceNumber <= 1) {
            rightDiceNumber = 5
        }
        print("Left Dice counter:\(leftDiceNumber)")
        print("Right Dice counter:\(rightDiceNumber)")
        print(Int.random(in: 1...10))
        */
    }
    
}

