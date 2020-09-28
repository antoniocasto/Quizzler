//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    
    @IBOutlet weak var firstButton: UIButton!
    var quizEngine = QuizEngine()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        upadateUI()
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        //Action when a button is pressed
        let userAnswer = sender.currentTitle!
        let res = quizEngine.checkAnswer(userAnswer)
        
        if res {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizEngine.increaseScore(res)
        
        quizEngine.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(upadateUI), userInfo: nil, repeats: false)
        
        //upadateUI() implemented with timer
    }
    
    @objc func upadateUI() {
        questionLabel.text = quizEngine.getQuestionText()
        let answers = quizEngine.getQuestionAnswes()
        firstButton.setTitle(answers[0], for: .normal)
        secondButton.setTitle(answers[1], for: .normal)
        thirdButton.setTitle(answers[2], for: .normal)
        progressBar.progress = quizEngine.getQuizProgress()
        scoreLabel.text = "Score: \(quizEngine.getScore())"
        firstButton.backgroundColor = UIColor.clear
        secondButton.backgroundColor = UIColor.clear
        thirdButton.backgroundColor = UIColor.clear
        
    }
    

}

