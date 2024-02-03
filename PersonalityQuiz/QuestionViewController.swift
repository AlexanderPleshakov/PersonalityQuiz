//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Александр Плешаков on 03.02.2024.
//

import UIKit

final class QuestionViewController: UIViewController {
    
    // MARK: Properties
    
    private var questionIndex = 2
    private var questions: [Question] = [
      Question(
        text: "Which food do you like the most?",
        type: .single,
        answers: [
          Answer(text: "Steak", type: .dog),
          Answer(text: "Fish", type: .cat),
          Answer(text: "Carrots", type: .rabbit),
          Answer(text: "Corn", type: .turtle)
        ]
      ),
      Question(
        text: "Which activities do you enjoy?",
        type: .multiple,
        answers: [
          Answer(text: "Swimming", type: .turtle),
          Answer(text: "Sleeping", type: .cat),
          Answer(text: "Cuddling", type: .rabbit),
          Answer(text: "Eating", type: .dog)
        ]
      ),
      Question(
        text: "How much do you enjoy car rides?",
        type: .ranged,
        answers: [
          Answer(text: "I dislike them", type: .cat),
          Answer(text: "I get a little nervous", type: .rabbit),
          Answer(text: "I barely notice them", type: .turtle),
          Answer(text: "I love them", type: .dog)
        ]
      )
    ]
    
    // MARK: Outlets

    @IBOutlet private weak var questionLabel: UILabel!
    
    @IBOutlet private weak var rangedStackView: UIStackView!
    @IBOutlet private weak var rangedFirstValueLabel: UILabel!
    @IBOutlet private weak var rangedSecondValueLabel: UILabel!
    
    @IBOutlet private weak var multipleStackView: UIStackView!
    @IBOutlet private var multipleLabels: [UILabel]!
    
    @IBOutlet private weak var singleStackView: UIStackView!
    @IBOutlet private var singleButtons: [UIButton]!
    
    @IBOutlet private weak var questionProgressView: UIProgressView!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    // MARK: Methods
    
    private func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        navigationItem.title = "Question \(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        }
        
        
    }
    
    private func updateSingleStack(using answers: [Answer]) {
        singleStackView.isHidden = false
        for index in 0..<singleButtons.count {
            singleButtons[index].setTitle(answers[index].text, for: .normal)
        }
    }
    
    private func updateMultipleStack(using answers: [Answer]) {
        multipleStackView.isHidden = false
        for index in 0..<multipleLabels.count {
            multipleLabels[index].text = answers[index].text
        }
    }
    
    private func updateRangedStack(using answers: [Answer]) {
        rangedStackView.isHidden = false
        rangedFirstValueLabel.text = answers.first?.text
        rangedSecondValueLabel.text = answers.last?.text
    }
    
    // MARK: Actions
    
    

}
