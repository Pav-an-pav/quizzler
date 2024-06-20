//
//  ViewController.swift
//  Quizzler
//
//  Created by Anna Pavlova on 04.06.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progessBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    

    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    @IBOutlet weak var choice3Button: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        choice1Button.layer.cornerRadius = 20
        choice1Button.clipsToBounds = true
        choice1Button.layer.borderWidth = 5
        choice1Button.layer.borderColor = UIColor(red: 69/255, green: 127/255, blue: 174/255, alpha: 1).cgColor
        
        choice2Button.layer.cornerRadius = 20
        choice2Button.clipsToBounds = true
        choice2Button.layer.borderWidth = 5
        choice2Button.layer.borderColor = UIColor(red: 69/255, green: 127/255, blue: 174/255, alpha: 1).cgColor
        
        choice3Button.layer.cornerRadius = 20
        choice3Button.clipsToBounds = true
        choice3Button.layer.borderWidth = 5
        choice3Button.layer.borderColor = UIColor(red: 69/255, green: 127/255, blue: 174/255, alpha: 1).cgColor
        
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let isUserRight = quizBrain.checkAnswer(userAnswer)
        
        
        if isUserRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
       
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI) , userInfo: nil, repeats: false)
        quizBrain.nextQuestion()
        
    }
    
    
    @objc func updateUI () {
        progessBar.progress = quizBrain.getProgressBar()
        questionLabel.text = quizBrain.getQuestionText()
        choice1Button.setTitle(quizBrain.getAnswerText(0), for: .normal)
        choice2Button.setTitle(quizBrain.getAnswerText(1), for: .normal)
        choice3Button.setTitle(quizBrain.getAnswerText(2), for: .normal)
        //arrayQuestions[questionNumber].text
        choice1Button.backgroundColor = UIColor.clear
        choice2Button.backgroundColor = UIColor.clear
        choice3Button.backgroundColor = UIColor.clear
        scoreLabel.text = "Score: \(quizBrain.getScore())"
    }
    
}

