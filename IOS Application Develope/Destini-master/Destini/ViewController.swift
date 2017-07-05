//
//  ViewController.swift
//  Destini
//

import UIKit

class ViewController: UIViewController {

    
    // UI Elements linked to the storyboard
    @IBOutlet weak var topButton: UIButton!         // Has TAG = 1
    @IBOutlet weak var bottomButton: UIButton!      // Has TAG = 2
    @IBOutlet weak var storyTextView: UILabel!
    
    var storyNumber : Int = 1
    var allStories = StoryBank()
    // TODO Step 5: Initialise instance variables here
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadStory()
        
        
        // TODO Step 3: Set the text for the storyTextView, topButton, bottomButton, and to T1_Story, T1_Ans1, and T1_Ans2
        
    }

    
    // User presses one of the buttons
    @IBAction func buttonPressed(_ sender: UIButton) {
        if storyNumber == 1 {
            if sender.tag == 1 {
                storyNumber = 3
            } else {
                storyNumber = 2
            }
        } else if storyNumber == 2 {
            if sender.tag == 1 {
                storyNumber = 3
            } else {
                storyNumber = 4
            }
        } else if storyNumber == 3 {
            if sender.tag == 1 {
                storyNumber = 6
            } else {
                storyNumber = 5
            }
        }
        
        loadStory()
        // TODO Step 4: Write an IF-Statement to update the views
                
        // TODO Step 6: Modify the IF-Statement to complete the story
        
    
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadStory() {
        
        storyTextView.text = allStories.list[storyNumber-1].storyText
        if storyNumber < 4 {
            topButton.setTitle(allStories.list[storyNumber-1].answerA, for: .normal)
            bottomButton.setTitle(allStories.list[storyNumber-1].answerB, for: .normal)
        } else {
            topButton.isHidden = true
            bottomButton.isHidden = true
            
            let title = NSAttributedString(string: "Story Ending!", attributes: [NSForegroundColorAttributeName : UIColor.black])
            let message = NSAttributedString(string: "Do you want to start over?", attributes: [NSForegroundColorAttributeName : UIColor.black])
            let alert = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
            
            let restartAction = UIAlertAction(title: "Try Again!", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            
            alert.setValue(title, forKey: "attributedTitle")
            alert.setValue(message, forKey: "attributedMessage")
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            
        }
    }
    
    func startOver() {
        storyNumber = 1
        topButton.isHidden = false
        bottomButton.isHidden = false
        loadStory()
    }
    
}

