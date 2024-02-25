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
    
    private func strToBool(_ str: String) -> Bool {
        return str.first == "t"
    }
    
    private func convertFromTagsToStringArray(tags: [Tag?]) -> [String?] {
        var stringTags: [String?] {
            var array = [String?]()
            for tag in tags {
                array.append(tag?.name)
            }
            return array
        }
        return stringTags
    }
    
    private func answersToStringArray(answers: Answers) -> [String?] {
        var result = [String?]()
        result.append(answers.answerA)
        result.append(answers.answerB)
        result.append(answers.answerC)
        result.append(answers.answerD)
        result.append(answers.answerE)
        result.append(answers.answerF)
        return result
    }
    
    private func correctAnswersToBoolArray(_ correctAnswers: CorrectAnswers) -> [Bool] {
        var result = [Bool]()
        result.append(strToBool(correctAnswers.answerACorrect))
        result.append(strToBool(correctAnswers.answerBCorrect))
        result.append(strToBool(correctAnswers.answerCCorrect))
        result.append(strToBool(correctAnswers.answerDCorrect))
        result.append(strToBool(correctAnswers.answerECorrect))
        result.append(strToBool(correctAnswers.answerFCorrect))
        return result
    }
    
    private func convertToQuizQuestions(questions: Questions) -> [QuizQuestion] {
        var result = [QuizQuestion]()
        for question in questions {
            let tags = convertFromTagsToStringArray(tags: question.tags)
            let quizQuestion = QuizQuestion(
                id: question.id, question: question.question,
                answers: answersToStringArray(answers: question.answers),
                correctAnswers: correctAnswersToBoolArray(question.correctAnswers),
                multipleCorrectAnswers: strToBool(question.multipleCorrectAnswers),
                correctAnswer: question.correctAnswer,
                tags: tags, category: question.category,
                difficulty: question.difficulty)
        }
        
        return result
    }
    
    func loadQuizQuestions() {
        questionsLoader.loadQuestions(url: Link.bash.url) { [weak self] result in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                switch result {
                case .success(let questions):
                    self.questions = self.convertToQuizQuestions(questions: questions)
                    
                    self.delegate?.didLoadData()
                case .failure(_):
                    self.delegate?.didFailToLoadData()
                }
            }
        }
    }
}
