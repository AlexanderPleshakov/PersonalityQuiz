//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Александр Плешаков on 03.02.2024.
//

import UIKit

final class ResultsViewController: UIViewController {
    
    // MARK: Properties
    var responses: [Answer]
    
    // MARK: Init
    init?(coder: NSCoder, responses: [Answer]) {
        self.responses = responses
        
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
        
        displayResults()
    }
    
    private func calculatePersonalityResults() -> AnimalType {
        let frequencyOfAnswers = responses.reduce(into: [:]) { (counts, answer) in
            counts[answer.type, default: 0] += 1
        }
        
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 >
           $1.1 }.first!.key
        
        return mostCommonAnswer

    }
    
    private func displayResults() {
        let result = calculatePersonalityResults()
        
        resultLabel.text = "You are a \(result.rawValue)"
        descriptionLabel.text = result.definition
    }
    
    // MARK: Actions
    
    
}
