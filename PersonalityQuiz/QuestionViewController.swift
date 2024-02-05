//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Александр Плешаков on 03.02.2024.
//

import UIKit

final class QuestionViewController: UIViewController {
    
    // MARK: Properties
    private var answersChosen: [Answer] = []
    private var questionIndex = 0
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
    
    // Third question
    @IBOutlet private weak var rangedStackView: UIStackView!
    @IBOutlet private weak var rangedFirstValueLabel: UILabel!
    @IBOutlet private weak var rangedSecondValueLabel: UILabel!
    @IBOutlet private weak var rangedSlider: UISlider!
    
    // Second question
    @IBOutlet private weak var multipleStackView: UIStackView!
    @IBOutlet private var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    // First question
    @IBOutlet private weak var singleStackView: UIStackView!
    @IBOutlet private var singleButtons: [UIButton]!
    
    @IBOutlet private weak var questionProgressView: UIProgressView!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        updateUI()
    }
    
    // MARK: Methods
    
    private func configure() {
        multipleSwitches.forEach {
            $0.setOn(false, animated: false)
        }
    }
    
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
        rangedSlider.setValue(0.5, animated: false)
        rangedFirstValueLabel.text = answers.first?.text
        rangedSecondValueLabel.text = answers.last?.text
    }
    
    private func nextQuestion() {
        questionIndex += 1
        
        guard questionIndex < questions.count else {
            performSegue(withIdentifier: "Results", sender: nil)
            return
        }
        
        updateUI()
    }
    
    // MARK: Actions
    
    @IBAction private func buttonSingleAnswerTapped(_ sender: UIButton) {
        let currentAnswer = questions[questionIndex].answers
        
        for index in 0..<singleButtons.count
        where singleButtons[index] == sender {
            answersChosen.append(currentAnswer[index])
        }
        
        nextQuestion()
    }
    
    @IBAction private func buttonMultipleAnswerTapped() {
        let currentAnswer = questions[questionIndex].answers
        
        for index in 0..<multipleLabels.count
        where multipleSwitches[index].isOn {
            answersChosen.append(currentAnswer[index])
        }
        
        nextQuestion()
    }
    
    @IBAction private func buttonRangedAnswerTapped() {
        let currentAnswer = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswer.count - 1)))
        
        answersChosen.append(currentAnswer[index])
        
        nextQuestion()
    }
    @IBSegueAction func showResultsSegue(_ coder: NSCoder) -> ResultsViewController? {
        return  ResultsViewController(coder: coder, responses: answersChosen)
    }
    
}
