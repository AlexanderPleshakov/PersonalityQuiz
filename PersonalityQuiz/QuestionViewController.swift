//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Александр Плешаков on 03.02.2024.
//

import UIKit

final class QuestionViewController: UIViewController {
    
    // MARK: Properties
    private var answersChosen: [String] = []
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
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    // MARK: Methods
    
    private func configure() {
        
    }
    
    // MARK: Actions
    
    
    @IBSegueAction func showResultsSegue(_ coder: NSCoder) -> ResultsViewController? {
        return  ResultsViewController(coder: coder, responses: answersChosen)
    }
    
}
