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

// MARK: - QuestionElement
struct QuestionElement: Codable {
    let id: Int
    let question: String
    let answers: Answers
    let multipleCorrectAnswers: String
    let correctAnswers: CorrectAnswers
    let correctAnswer: String?
    let tags: [Tag?]
    let category, difficulty: String
}

// MARK: - Answers
struct Answers: Codable {
    let answerA, answerB, answerC,
        answerD, answerE, answerF: String?
}

// MARK: - CorrectAnswers
struct CorrectAnswers: Codable {
    let answerACorrect, answerBCorrect, answerCCorrect,
        answerDCorrect, answerECorrect, answerFCorrect: String?
}

struct Tag: Codable {
    let name: String
}

typealias Questions = [QuestionElement]


