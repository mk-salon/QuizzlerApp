//
//  ViewController.swift
//  Quizzler-iOS13
//


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionlabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle! // "True" or "False"
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionlabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress() // progresBar.progress from 0.0 to 1.0
        // 1/12, 2/12, 3/12...12/12 = 1.0
        scoreLabel.text = "Score \(quizBrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    
    }
}

