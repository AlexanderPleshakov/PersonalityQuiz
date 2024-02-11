//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Александр Плешаков on 03.02.2024.
//

import UIKit

final class ResultsViewController: UIViewController {
    
    // MARK: Properties
    private var correctAnswers: Int
    private var questionsCount: Int
    
    // MARK: Init
    init?(coder: NSCoder, correctAnswers: Int, questionsCount: Int) {
        self.correctAnswers = correctAnswers
        self.questionsCount = questionsCount
        
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Outlets
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    // MARK: Methods
    
    private func configure() {
        navigationItem.hidesBackButton = true
        descriptionLabel.isHidden = true
        
        displayResults()
    }
    
    private func displayResults() {
        resultLabel.text = "You have answered \(correctAnswers) out of \(questionsCount) questions"
    }
    
    // MARK: Actions
    
    
}
