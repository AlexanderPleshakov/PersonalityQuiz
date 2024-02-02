//
//  IntroductionQuizViewController.swift
//  PersonalityQuiz
//
//  Created by Александр Плешаков on 02.02.2024.
//

import UIKit

final class IntroductionQuizViewController: UIViewController {

    @IBOutlet private weak var titleStackView: UIStackView!
    @IBOutlet private weak var mainStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        titleStackView.isUserInteractionEnabled = true
        mainStackView.isUserInteractionEnabled = true
    }
    


}

