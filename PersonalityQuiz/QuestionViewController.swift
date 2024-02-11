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
    private var questions: [Question] = []
    
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
