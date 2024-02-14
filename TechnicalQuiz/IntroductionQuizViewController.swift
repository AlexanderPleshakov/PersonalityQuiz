//
//  IntroductionQuizViewController.swift
//  PersonalityQuiz
//
//  Created by Александр Плешаков on 02.02.2024.
//

import UIKit

final class IntroductionQuizViewController: UIViewController {
    // MARK: Properties
    
    var quizTitle: String?
    
    // MARK: Outlets
    
    @IBOutlet weak var quizDescriptionLabel: UILabel!
    @IBOutlet weak var quizTitleLabel: UILabel!
    
    // MARK: Init
    
    init?(coder: NSCoder, quizTitle: String?) {
        self.quizTitle = quizTitle
        
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    // MARK: Methods
    
    private func configure() {
        quizTitleLabel.text = quizTitle
    }
    
    // MARK: Actions
    
    @IBAction func unwindToQuizIntroduction(segue: UIStoryboardSegue) {
        
    }
    


}

