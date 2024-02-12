//
//  Question.swift
//  PersonalityQuiz
//
//  Created by Александр Плешаков on 03.02.2024.
//

import Foundation

protocol QuestionProtocol {
    var question: String { get }
    var answers: [String?] { get }
    var correctAnswers: [Bool] { get }
}

struct MockQuestion: QuestionProtocol {
    var question: String
    var answers: [String?]
    var correctAnswers: [Bool]
}

struct Question: QuestionProtocol {
    var id: Int
    var question: String
    var description: String?
    var answers: [String?]
    var multipleCorrectAnswers: Bool
    var correctAnswers: [Bool]
    var explanation: String?
    var category: String
    var difficulty: String
}
