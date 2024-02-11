//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Александр Плешаков on 03.02.2024.
//

import UIKit

final class QuestionViewController: UIViewController {
    
    // MARK: Properties
    private var correctAnswers = 0
    private var questionIndex = 0
    private var questions: [QuestionProtocol] = [MockQuestion(
                                                    question: "tcpdump is a packet-sniffing Linux command that offers administrators the ability to monitor what?",
                                                    answers: ["Server performance", "Network traffic and activity", "Application performance", "Files and directories", nil, nil],
                                                    correctAnswers: [false, true, false, false, false, false]),
                                                 MockQuestion(
                                                    question: "How to list only the running containers?",
                                                    answers: ["docker list", "docker ps", "docker run", "docker print", nil, nil],
                                                    correctAnswers: [false, true, false, false, false, false]),
                                                 MockQuestion(
                                                    question: "Which HTML tag would be used to display power in expression (A+B)2 ?",
                                                    answers: ["<sup>", "<p>", "<b>", "<sub>", nil, nil],
                                                    correctAnswers: [true, false, false, false, false, false])]
    
    // MARK: Outlets
    
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private weak var questionProgressView: UIProgressView!
    
    @IBOutlet private var AnswerButtons: [UIButton]!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
    }
    
    // MARK: Methods
    
    private func configure() {
        updateUI()
        questionProgressView.setProgress(0, animated: false)
    }
    
    private func updateUI() {
        questionLabel.text = questions[questionIndex].question
        for (index, button) in AnswerButtons.enumerated() {
            if let answer = questions[questionIndex].answers[index] {
                button.isHidden = false
                button.setTitle(answer, for: .normal)
            } else {
                button.isHidden = true
            }
        }
        updateProgress()
    }
    
    private func updateProgress() {
        let currentProgress = questionProgressView.progress + Float(1)/Float(questions.count)
        questionProgressView.setProgress(currentProgress, animated: true)
    }
    
    private func nextQuestionOrResults(sender: UIButton) {
        let currentQuestion = questions[questionIndex]
        for index in 0..<currentQuestion.answers.count where
        currentQuestion.correctAnswers[index] {
            if sender.titleLabel?.text == currentQuestion.answers[index] {
                correctAnswers += 1
            }
        }
        questionIndex += 1
        if questionIndex == questions.count {
            updateProgress()
            return
        }
        updateUI()
    }
    
    // MARK: Actions
    
    @IBAction func buttonAnswerTapped(_ sender: UIButton) {
        nextQuestionOrResults(sender: sender)
    }
    
    
//    @IBSegueAction func showResultsSegue(_ coder: NSCoder) -> ResultsViewController? {
//        return  ResultsViewController(coder: coder, responses: answersChosen)
//    }
    
}
