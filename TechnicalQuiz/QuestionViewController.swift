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
    private var questions: Questions = []
    
    // MARK: Outlets
    
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private weak var questionProgressView: UIProgressView!
    
    @IBOutlet private var answerButtons: [UIButton]!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var networkManager = NetworkManager.shared
        networkManager.fetchBash()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
            self?.questions = networkManager.questions
            print(self?.questions)
        }
        
        
       // configure()
    }
    
    // MARK: Methods
    
    private func configure() {
        navigationItem.hidesBackButton = true
        updateUI()
    }
    
    private func updateUI() {
        navigationItem.title = "Question \(questionIndex + 1)"
        questionLabel.text = questions[questionIndex].question
        for (_, button) in answerButtons.enumerated() {
            if let answer = questions[questionIndex].answers {
                button.isHidden = false
                button.setTitle(answer, for: .normal)
            } else {
                button.isHidden = true
            }
        }
        updateProgress()
    }
    
    private func updateProgress() {
        let progress = Float(questionIndex)/Float(questions.count)
        questionProgressView.setProgress(progress, animated: true)
    }
    
    private func showResults(sender: UIButton) {
        defer {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
                self?.performSegue(withIdentifier: "Results", sender: sender)
            }
        }
        updateProgress()
    }
    
    private func nextQuestionOrResults(sender: UIButton) {
//        let currentQuestion = questions![questionIndex]
//        for index in 0..<currentQuestion.answers.answerA where
//        currentQuestion.correctAnswers[index] {
//            if sender.titleLabel?.text == currentQuestion.answers[index] {
//                correctAnswers += 1
//            }
//        }
//        questionIndex += 1
//        if questionIndex == questions!.count {
//            showResults(sender: sender)
//            return
//        }
//        updateUI()
    }
    
    // MARK: Actions
    
    @IBAction func buttonAnswerTapped(_ sender: UIButton) {
        nextQuestionOrResults(sender: sender)
    }
    
    @IBSegueAction func showResultsSegue(_ coder: NSCoder) -> ResultsViewController? {
        return  ResultsViewController(coder: coder,
                                      correctAnswers: correctAnswers,
                                      questionsCount: questions!.count)
    }
    
}
