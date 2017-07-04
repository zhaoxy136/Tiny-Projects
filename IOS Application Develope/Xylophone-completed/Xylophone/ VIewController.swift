//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //Create a new AVAudio Player.
    var audioPlayer : AVAudioPlayer!
    
    //Create an array that contains all the sound file names.
    //let soundArray = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //This gets triggered when any of the xylophone buttons are pressed.
    @IBAction func notePressed(_ sender: UIButton) {
        playSound(soundFileName: "note\(sender.tag)")
        
    }
    
    func playSound(soundFileName : String) {
        
        let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: "wav")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
        //This catches and prints out any errors encountered by the AVAudioPlayer.
        catch  {
            print(error)
        }
        
        audioPlayer.play()
    }
}





