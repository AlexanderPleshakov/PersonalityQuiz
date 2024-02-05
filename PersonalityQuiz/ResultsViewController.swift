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
    
    
    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    // MARK: Methods
    
    
    
    // MARK: Actions
    
    
}
