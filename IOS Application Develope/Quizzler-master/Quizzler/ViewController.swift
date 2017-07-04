//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    var allQuestions = QuestionBank()
    var pickedAnswer = false
    var questionNumber = 0
    var currentScore = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        } else if sender.tag == 2 {
            pickedAnswer = false
        }
        checkAnswer()
        questionNumber = questionNumber + 1
        
        nextQuestion()
        
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score: \(currentScore)"
        progressLabel.text = "\(questionNumber + 1) / 13"
        progressBar.frame.size.width = (view.frame.size.width) / 13 * CGFloat(questionNumber + 1)
      
    }
    

    func nextQuestion() {
        if questionNumber < 13 {
            questionLabel.text = allQuestions.list[questionNumber].questionText
            updateUI()
            
        } else {
            scoreLabel.text = "Score: \(currentScore)"
            let alert = UIAlertController(title: "Awesome!", message: "You've completed the Quiz and you've got \(currentScore) scores! Do you want to start again?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    func checkAnswer() {
        if pickedAnswer == allQuestions.list[questionNumber].answer {
            ProgressHUD.showSuccess("correct!")
            currentScore = currentScore + 1
        } else {
            ProgressHUD.showError("wrong!")
        }
        
    }
    
    
    func startOver() {
        questionNumber = 0
        currentScore = 0
        nextQuestion()
    }
    

    
}
