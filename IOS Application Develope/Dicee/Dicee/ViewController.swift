//
//  ViewController.swift
//  Dicee
//
//  Created by Zhao Xiangyu on 6/26/17.
//  Copyright © 2017 Barryzhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var randomDiceIndex1 : Int = 0
    var randomDiceIndex2 : Int = 0

    let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    @IBOutlet weak var LeftDice: UIImageView!
    @IBOutlet weak var RightDice: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ChangeDiceViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func RollDices(_ sender: UIButton) {
        ChangeDiceViews()
    }
    func ChangeDiceViews() {
        randomDiceIndex1 = Int(arc4random_uniform(6))
        randomDiceIndex2 = Int(arc4random_uniform(6))
        
        LeftDice.image = UIImage(named: diceArray[randomDiceIndex1])
        RightDice.image = UIImage(named: diceArray[randomDiceIndex2])
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        ChangeDiceViews()
    }
}

