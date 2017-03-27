//
//  ViewController.swift
//  Quiz
//
//  Created by Shen Xiaochun on 2017/3/17.
//  Copyright © 2017年 Sigutian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var currentQuesitonLabel: UILabel!
    @IBOutlet var nextQuestionLabel: UILabel!
    
    
    @IBOutlet var answerLabel: UILabel!
    
    @IBAction func showNextQuestion(_ sender: UIButton) {
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        
        let question = questions[currentQuestionIndex]
//        questionLabel.text = question
        nextQuestionLabel.text = question
        answerLabel.text = "???"
        
        animateLabelTransitions()
    }
    
    @IBAction func showAnswer(_ sender: UIButton) {
        let answer = answers[currentQuestionIndex]
        answerLabel.text = answer
        
    }
    
    let questions: [String] = [
        "What is 7+7?",
        "What is the capital of Vermont?",
        "What is congac made from?"
    ]
    let answers: [String] = [
        "14",
        "Montpelier",
        "Grapes"
    ]
    var currentQuestionIndex: Int = 0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuesitonLabel.text = questions[currentQuestionIndex]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func animateLabelTransitions() {

        
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: { self.currentQuesitonLabel.alpha = 0
            self.nextQuestionLabel.alpha = 1 }, completion: { _ in swap (&self.currentQuesitonLabel, &self.nextQuestionLabel) }
        )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Set the label's initial alpha
//        questionLabel.alpha = 0
        nextQuestionLabel.alpha = 0
    }
    
}

