//
//  QuestionsFactory.swift
//  TechnicalQuiz
//
//  Created by Александр Плешаков on 24.02.2024.
//

import UIKit

final class QuestionsFactory {
    var questions = [QuizQuestion]()
    let questionsLoader = QuestionsLoader()
    weak var delegate: QuestionsFactoryDelegate?
    
    init(delegate: QuestionsFactoryDelegate) {
        self.delegate = delegate
    }
    
    private func constructLink() {
        
    }
    
    func loadQuizQuestions() {
        questionsLoader.loadQuestions(url: Link.bash.url) { [weak self] result in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                switch result {
                case .success(let questions):
                    self.questions = TypeConverter.questionsToQuizQuestions(questions: questions)
                    
                    self.delegate?.didLoadData()
                case .failure(_):
                    self.delegate?.didFailToLoadData()
                }
            }
        }
    }
}
