//
//  Question.swift
//  PersonalityQuiz
//
//  Created by Александр Плешаков on 03.02.2024.
//

import Foundation


struct Question {
    var id: Int
    var question: String
    var description: String
    var answers: [String?]
    var multipleCorrectAnswers: Bool
    var correctAnswers: [Bool]
    var explanation: String
    var category: String
    var difficulty: String
}
