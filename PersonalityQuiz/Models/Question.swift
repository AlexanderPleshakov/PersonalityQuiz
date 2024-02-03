//
//  Question.swift
//  PersonalityQuiz
//
//  Created by Александр Плешаков on 03.02.2024.
//

import Foundation



struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}
