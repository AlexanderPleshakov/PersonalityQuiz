//
//  StartQuizViewController.swift
//  PersonalityQuiz
//
//  Created by Александр Плешаков on 02.02.2024.
//

import UIKit

final class StartQuizViewController: UIViewController {

    @IBOutlet weak var titleStackView: UIStackView!
    @IBOutlet weak var mainStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        titleStackView.isUserInteractionEnabled = true
        mainStackView.isUserInteractionEnabled = true
    }
    


}

