//
//  QuizQuestion.swift
//  TechnicalQuiz
//
//  Created by Александр Плешаков on 24.02.2024.
//

import Foundation

protocol QuestionProtocol {
    var question: String { get }
    var answers: [String?] { get }
    var correctAnswers: [Bool] { get }
}

struct QuizQuestion: QuestionProtocol {
    let id: Int
    let question: String
    let answers: [String?]
    let correctAnswers: [Bool]
    let multipleCorrectAnswers: Bool
    let correctAnswer: String?
    let tags: [String?]
    let category, difficulty: String
}
