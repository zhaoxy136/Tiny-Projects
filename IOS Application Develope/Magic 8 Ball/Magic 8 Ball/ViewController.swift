//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Zhao Xiangyu on 7/1/17.
//  Copyright © 2017 Barryzhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var answerView: UIImageView!
    
    var randomAnswerIndex : Int = 0
    let answerArray = ["ball1", "ball2", "ball3", "ball4", "ball5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getAnswer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func askPressed(_ sender: Any) {
        getAnswer()
    }
    
    func getAnswer() {
        randomAnswerIndex = Int(arc4random_uniform(5))
        answerView.image = UIImage(named: answerArray[randomAnswerIndex])
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        getAnswer()
    }
    
}

