//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Александр Плешаков on 03.02.2024.
//

import UIKit

final class ResultsViewController: UIViewController {
    
    // MARK: Properties
    var responses: Int
    
    // MARK: Init
    init?(coder: NSCoder, responses: Int) {
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
    
    private func displayResults() {

    }
    
    // MARK: Actions
    
    
}
